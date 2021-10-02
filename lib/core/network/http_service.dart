import 'package:dio/dio.dart';
import 'package:quotes/core/network/custom_network_exception.dart';

abstract class HttpService {
  Future<Map<String, dynamic>> post(String endpointUrl,
      {Map<String, dynamic>? data});

  Future<Map<String, dynamic>> get(String endpointUrl,
      {Map<String, dynamic>? data});

  static HttpService internal(String baseUrl) => HttpServiceImpl(baseUrl);
}

class HttpServiceImpl extends HttpService {
  late final Dio baseDio;
  String baseUrl;

  HttpServiceImpl(this.baseUrl) {
    baseDio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 20000,
        receiveTimeout: 20000,
        responseType: ResponseType.json,
      ),
    );
    baseDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.resolve(response);
        },
        onError: (DioError error, handler) async {
          handler.reject(error);
          throw CustomNetworkException(message: error.message);
        },
      ),
    );
  }

  @override
  Future<Map<String, dynamic>> get(String endpointUrl,
      {Map<String, dynamic>? data}) async {
    return decodeResponse(
      await baseDio.get(
        endpointUrl,
        queryParameters: data,
      ),
    );
  }

  @override
  Future<Map<String, dynamic>> post(String endpointUrl,
      {Map<String, dynamic>? data}) async {
    return decodeResponse(
      await baseDio.post(
        endpointUrl,
        data: data,
      ),
    );
  }

  Map<String, dynamic> decodeResponse(Response response) {
    if (response.statusCode != null) {
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return response.data;
      }
    }
    throw CustomNetworkException(
        statusCode: response.statusCode,
        message: response.data?['message'] ?? response.statusMessage);
  }
}
