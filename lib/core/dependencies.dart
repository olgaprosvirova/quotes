import 'package:quotes/core/network/http_service.dart';
import 'package:quotes/repository/quotes_repository.dart';
import 'package:quotes/service/api/api_quotes_service.dart';
import 'package:quotes/ui/elements/app_theme.dart';

class Dependencies {
  AppThemeData? _appThemeData;
  HttpService? _httpService;
  ApiQuotesService? _apiQuotesService;
  QuotesRepository? _quotesRepository;
  AppThemeData get appThemeData => _appThemeData ??= AppThemeData();
  HttpService get httpService => _httpService ??= HttpServiceImpl();
  ApiQuotesService get apiQuotesService => _apiQuotesService ??= ApiQuotesServiceImpl(httpService);
  QuotesRepository get quotesRepository => _quotesRepository ??= QuotesRepositoryImpl(apiQuotesService);
}
