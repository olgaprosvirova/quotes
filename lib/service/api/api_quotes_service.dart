import 'package:quotes/core/network/http_service.dart';

abstract class ApiQuotesService {
  ApiQuotesService(HttpService httpService);

  Future<Map<String, dynamic>> getRandomQuote();
}

class ApiQuotesServiceImpl implements ApiQuotesService {
  final String baseUrl = 'https://animechan.vercel.app/api';
  late final HttpService httpService;
  final String randomQuoteEndpoint = '/random';

  ApiQuotesServiceImpl(){
    httpService = HttpService.internal(baseUrl);
  }

  @override
  Future<Map<String, dynamic>> getRandomQuote() async {
    return await httpService.get(randomQuoteEndpoint);
  }
}
