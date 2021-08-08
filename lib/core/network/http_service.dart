import 'package:dio/dio.dart';
import 'package:quotes/core/network/custom_network_exception.dart';

abstract class HttpService {
  Future<Map<String, dynamic>> post(
      String endpointUrl, Map<String, dynamic> data);

  Future<Map<String, dynamic>> get(
      String endpointUrl, Map<String, dynamic> data);
}

class HttpServiceImpl implements HttpService {
  late final Dio baseDio;
  String baseUrl = '';

  HttpServiceImpl() {
    baseDio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 20000,
        receiveTimeout: 20000,
        responseType: ResponseType.json,
      ),
    );
  }

  @override
  Future<Map<String, dynamic>> get(
      String endpointUrl, Map<String, dynamic> data) async {
    return decodeResponse(
      await baseDio.get(
        endpointUrl,
        queryParameters: data,
      ),
    );
  }

  @override
  Future<Map<String, dynamic>> post(
      String endpointUrl, Map<String, dynamic> data) async {
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
        message: response.data['message'] ?? response.statusMessage);
  }
}
