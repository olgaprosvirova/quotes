import 'package:flutter/material.dart';
import 'package:quotes/core/dependencies.dart';
import 'package:quotes/ui/screens/quotes_screen/quotes_screen.dart';

class MyApp extends StatelessWidget with Dependencies {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boku No Anime Quotes',
      theme: appThemeData.defaultLightTheme,
      home: QuotesScreen(),
    );
  }
}
