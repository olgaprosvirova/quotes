import 'package:quotes/model/title_model.dart';

class CharacterModel {
  final int malId;
  final String? url;
  final String? imageUrl;
  final String? name;
  final List<String?> alternativeNames;
  final List<TitleModel> anime;
  final List<TitleModel> manga;

  CharacterModel({
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.name,
    required this.alternativeNames,
    required this.anime,
    required this.manga,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    var malId = json['mal_id']?.toInt();
    var url = json['url']?.toString();
    var imageUrl = json['image_url']?.toString();
    var name = json['name']?.toString();
    var alternativeNames = <String>[];
    if (json['alternative_names'] != null) {
      json['alternative_names'].forEach((v) {
        alternativeNames.add(v.toString());
      });
    }
    var anime = <TitleModel>[];
    if (json['anime'] != null) {
      json['anime'].forEach((v) {
        anime.add(TitleModel.fromJson(v, TitleType.anime));
      });
    }
    var manga = <TitleModel>[];
    if (json['manga'] != null) {
      json['manga'].forEach((v) {
        manga.add(TitleModel.fromJson(v, TitleType.manga));
      });
    }
    return CharacterModel(
        malId: malId,
        url: url,
        imageUrl: imageUrl,
        name: name,
        alternativeNames: alternativeNames,
        anime: anime,
        manga: manga);
  }
}
