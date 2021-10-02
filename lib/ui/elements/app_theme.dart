import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  ThemeData get defaultLightTheme => ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amberAccent),
        textTheme: GoogleFonts.quicksandTextTheme(),
      );
}
