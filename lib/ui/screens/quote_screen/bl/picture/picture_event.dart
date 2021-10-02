abstract class PictureEvent {}

class CharacterPictureLoadEvent extends PictureEvent{
  final String character;

  CharacterPictureLoadEvent(this.character);
}