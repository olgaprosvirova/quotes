enum TitleType { anime, manga }

class TitleModel {
  final int malId;
  final String? type;
  final String? name;
  final String? url;
  final TitleType titleType;

  TitleModel({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
    required this.titleType,
  });

  factory TitleModel.fromJson(Map<String, dynamic> json, TitleType titleType) {
    var malId = json['mal_id']?.toInt();
    var type = json['type']?.toString();
    var name = json['name']?.toString();
    var url = json['url']?.toString();
    return TitleModel(
      malId: malId,
      type: type,
      name: name,
      url: url,
      titleType: titleType,
    );
  }
}
