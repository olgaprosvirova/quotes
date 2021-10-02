import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/ui/screens/quote_screen/bl/quote/quote_bloc.dart';
import 'package:quotes/ui/screens/quote_screen/bl/quote/quote_state.dart';


class QuoteLayout extends StatelessWidget {

  const QuoteLayout({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (context, state) => state.isLoaded
          ? Column(
              children: [
                Text('Anime: ${state.quote?.anime}'),
                Text('Character: ${state.quote?.character}'),
                Text('Quote: ${state.quote?.quote}'),
               /* FutureBuilder(
                  future:
                      repository.getCharacterImageUrl(snapshot.data!.character),
                  builder: (context, snapshot) {

                      return snapshot.hasData
                          ? snapshot.data is String
                          ? Image.network(snapshot.data as String)
                          : Container()
                          : const Center(child: CircularProgressIndicator());
                  }
                )*/
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
