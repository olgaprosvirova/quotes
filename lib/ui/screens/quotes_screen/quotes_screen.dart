import 'package:flutter/material.dart';
import 'package:quotes/repository/quotes_repository.dart';
import 'package:quotes/ui/screens/quotes_screen/quotes_layout.dart';

class QuotesScreen extends StatelessWidget {
  final QuotesRepository repository;
  const QuotesScreen({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuotesLayout(repository.getRandomQuote()),
    );
  }
}
