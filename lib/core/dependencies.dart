import 'package:quotes/repository/quotes_repository.dart';
import 'package:quotes/service/api/api_picture_service.dart';
import 'package:quotes/service/api/api_quotes_service.dart';
import 'package:quotes/ui/elements/app_theme.dart';

class Dependencies {
  AppThemeData? _appThemeData;
  ApiQuotesService? _apiQuotesService;
  ApiPictureService? _apiPictureService;
  QuotesRepository? _quotesRepository;

  AppThemeData get appThemeData => _appThemeData ??= AppThemeData();

  ApiQuotesService get apiQuotesService =>
      _apiQuotesService ??= ApiQuotesServiceImpl();

  ApiPictureService get apiPictureService =>
      _apiPictureService ??= ApiPictureServiceImpl();

  QuotesRepository get quotesRepository => _quotesRepository ??=
      QuotesRepositoryImpl(apiQuotesService, apiPictureService);
}
