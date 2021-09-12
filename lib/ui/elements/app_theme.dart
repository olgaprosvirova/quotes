import 'package:flutter/material.dart';

class AppThemeData {
  ThemeData get defaultLightTheme => ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amberAccent),
      );
}
