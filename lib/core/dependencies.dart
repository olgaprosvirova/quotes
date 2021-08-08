import 'package:quotes/ui/elements/app_theme.dart';

class Dependencies {
  late final AppThemeData? _appThemeData;

  AppThemeData get appThemeData => _appThemeData ?? AppThemeData();
}
