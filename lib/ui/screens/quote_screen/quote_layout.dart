import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/ui/elements/loading_widget.dart';
import 'package:quotes/ui/elements/quote_widget.dart';
import 'package:quotes/ui/screens/quote_screen/bl/picture/picture_bloc.dart';
import 'package:quotes/ui/screens/quote_screen/bl/picture/picture_state.dart';
import 'package:quotes/ui/screens/quote_screen/bl/quote/quote_bloc.dart';
import 'package:quotes/ui/screens/quote_screen/bl/quote/quote_state.dart';
import 'package:quotes/ui/screens/quote_screen/bl/picture/picture_event.dart';

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
          ? Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  BlocBuilder<PictureBloc, PictureState>(
                      builder: (context, state) {
                    return Expanded(
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          child: state.isLoaded
                              ? Image.network(
                                  state.url!,
                                  fit: BoxFit.cover,
                                )
                              : state.isLoading
                                  ? const LoadingWidget()
                                  : const Text('No image')),
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  QuoteWidget(
                    quote: state.quote!.quote,
                    character: state.quote!.character,
                    anime: state.quote!.anime,
                  ),
                ],
              ),
            )
          : state.isLoading
              ? const LoadingWidget()
              : Container(),
    );
  }
}
