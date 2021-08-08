import 'package:flutter/material.dart';
import 'package:quotes/ui/screens/quotes_screen/quotes_layout.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: QuotesLayout(),
    );
  }
}
