import 'package:flutter/material.dart';
import 'package:quotes/repository/quotes_repository.dart';
import 'package:quotes/ui/screens/quote_screen/bl/quote/quote_bloc.dart';
import 'package:quotes/ui/screens/quote_screen/quote_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteScreen extends StatelessWidget {
  final QuotesRepository repository;

  const QuoteScreen({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (BuildContext context) => QuoteBloc(repository),
          child: const QuoteLayout()),
    );
  }
}
