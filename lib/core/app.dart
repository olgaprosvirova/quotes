import 'package:flutter/material.dart';
import 'package:quotes/core/dependencies.dart';
import 'package:quotes/ui/screens/quote_screen/quote_screen.dart';

// ignore: must_be_immutable
class QuotesApp extends StatelessWidget with Dependencies {
  QuotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var i = 0;
    return MaterialApp(
      title: 'Boku No Anime Quotes $i',
      theme: appThemeData.defaultLightTheme,
      home: QuoteScreen(repository: quotesRepository),
    );
  }
}
