import 'package:quotes/repository/quotes_repository.dart';
import 'package:quotes/service/api/api_quotes_service.dart';
import 'package:quotes/ui/elements/app_theme.dart';

class Dependencies {
  AppThemeData? _appThemeData;
  ApiQuotesService? _apiQuotesService;
  QuotesRepository? _quotesRepository;
  AppThemeData get appThemeData => _appThemeData ??= AppThemeData();
  ApiQuotesService get apiQuotesService => _apiQuotesService ??= ApiQuotesServiceImpl();
  QuotesRepository get quotesRepository => _quotesRepository ??= QuotesRepositoryImpl(apiQuotesService);
}
