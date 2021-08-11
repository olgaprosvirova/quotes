import 'package:flutter/material.dart';
import 'package:quotes/core/dependencies.dart';
import 'package:quotes/ui/screens/quotes_screen/quotes_screen.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget with Dependencies {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return MaterialApp(
      title: 'Boku No Anime Quotes $i',
      theme: appThemeData.defaultLightTheme,
      home: QuotesScreen(repository: quotesRepository),
    );
  }
}
