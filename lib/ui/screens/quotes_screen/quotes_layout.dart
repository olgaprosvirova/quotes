import 'package:flutter/material.dart';
import 'package:quotes/model/quote_model.dart';
import 'package:quotes/repository/quotes_repository.dart';

class QuotesLayout extends StatelessWidget {
  final Future<QuoteModel> snapshot;

  final QuotesRepository repository;

  const QuotesLayout(this.snapshot, this.repository, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuoteModel>(
      future: snapshot,
      builder: (context, snapshot) => snapshot.hasData
          ? Column(
              children: [
                Text('Anime: ${snapshot.data?.anime}'),
                Text('Character: ${snapshot.data?.character}'),
                Text('Quote: ${snapshot.data?.quote}'),
                FutureBuilder(
                  future:
                      repository.getCharacterImageUrl(snapshot.data!.character),
                  builder: (context, snapshot) {

                      return snapshot.hasData
                          ? snapshot.data is String
                          ? Image.network(snapshot.data as String)
                          : Container()
                          : const Center(child: CircularProgressIndicator());
                  }
                )
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
