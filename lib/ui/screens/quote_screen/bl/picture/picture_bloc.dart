import 'package:quotes/core/base_bloc.dart';
import 'package:quotes/repository/quotes_repository.dart';
import 'package:quotes/ui/screens/quote_screen/bl/picture/picture_event.dart';
import 'package:quotes/ui/screens/quote_screen/bl/picture/picture_state.dart';

class PictureBloc extends BaseBloc<PictureEvent, PictureState> {
  final QuotesRepository repository;

  PictureBloc(this.repository) : super(PictureState(status: Status.initial));

  @override
  Stream<PictureState> mapEventToState(PictureEvent event) async* {
    if (event is CharacterPictureLoadEvent) {
      yield PictureState(status: Status.loading);
      try {
        var url = await repository.getCharacterImageUrl(event.character);
        yield PictureState(status: Status.loaded, url: url);
      } catch (e) {
        yield PictureState(status: Status.error);
      }
    }
  }
}
