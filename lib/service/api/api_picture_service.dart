import 'package:quotes/core/network/http_service.dart';

abstract class ApiPictureService {
  ApiPictureService();

  Future<Map<String, dynamic>> search(Map<String, dynamic> data);
}

class ApiPictureServiceImpl implements ApiPictureService {
  final String baseUrl = 'https://api.jikan.moe/v3';
  late final HttpService httpService;
  final String searchEndpoint = '/search/character';

  ApiPictureServiceImpl(){
    httpService = HttpService.internal(baseUrl);
  }

  @override
  Future<Map<String, dynamic>> search(Map<String, dynamic> data) async {
    return await httpService.get(searchEndpoint, data: data);
  }
}
