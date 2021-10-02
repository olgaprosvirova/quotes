import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  ThemeData defaultLightTheme (BuildContext context) => ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amberAccent),
        textTheme: GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme,),
      );
}
