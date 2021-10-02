import 'package:quotes/core/base_bloc.dart';
import 'package:quotes/repository/quotes_repository.dart';
import 'package:quotes/ui/screens/quote_screen/bl/quote/quote_event.dart';
import 'package:quotes/ui/screens/quote_screen/bl/quote/quote_state.dart';

class QuoteBloc extends BaseBloc<QuoteEvent, QuoteState> {
  final QuotesRepository repository;
  QuoteBloc(this.repository) : super(QuoteState(status: Status.initial)) {
    add(QuoteLoadEvent());
  }

  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    if (event is QuoteLoadEvent) {
      yield QuoteState(status: Status.loading);
      try {
        var quote = await repository.getRandomQuote();
        yield QuoteState(status: Status.loaded, quote: quote);
      } catch(e) {
        yield QuoteState(status: Status.error);
      }
    }
  }
}
