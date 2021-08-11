import 'package:flutter/material.dart';
import 'package:quotes/model/quote_model.dart';

class QuotesLayout extends StatelessWidget {
  final Future<QuoteModel> snapshot;
  const QuotesLayout( this.snapshot, {Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuoteModel>(
      future: snapshot,
      builder:(context, snapshot)=> snapshot.hasData ? Column(
        children: [
          Text('Anime: ${snapshot.data?.anime}'),
          Text('Character: ${snapshot.data?.character}'),
          Text('Quote: ${snapshot.data?.quote}'),
        ],
      ) : const Center(child: CircularProgressIndicator()),
    );
  }
}
