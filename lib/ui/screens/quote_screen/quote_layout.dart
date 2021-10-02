import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/ui/screens/quote_screen/bl/picture/picture_bloc.dart';
import 'package:quotes/ui/screens/quote_screen/bl/picture/picture_state.dart';
import 'package:quotes/ui/screens/quote_screen/bl/quote/quote_bloc.dart';
import 'package:quotes/ui/screens/quote_screen/bl/quote/quote_state.dart';

import 'bl/picture/picture_event.dart';

class QuoteLayout extends StatelessWidget {
  const QuoteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuoteBloc, QuoteState>(
      listener: (context, state) {
        if (state.isLoaded) {
          BlocProvider.of<PictureBloc>(context)
              .add(CharacterPictureLoadEvent(state.quote!.character));
        }
      },
      builder: (context, state) => state.isLoaded
          ? Column(
              children: [
                Text('Anime: ${state.quote?.anime}'),
                Text('Character: ${state.quote?.character}'),
                Text('Quote: ${state.quote?.quote}'),
                BlocBuilder<PictureBloc, PictureState>(
                    builder: (context, state) {
                  return state.isLoaded
                      ? Image.network(state.url!)
                      : state.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : const Text('No image');
                })
              ],
            )
          : state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(),
    );
  }
}
