import 'package:quotes/core/network/http_service.dart';
import 'package:quotes/ui/elements/app_theme.dart';

class Dependencies {
  AppThemeData? _appThemeData;
  HttpService? _httpService;
  AppThemeData get appThemeData => _appThemeData ??= AppThemeData();
  HttpService get httpService => _httpService ??= HttpServiceImpl();
}
