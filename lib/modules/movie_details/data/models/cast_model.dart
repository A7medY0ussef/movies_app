
import 'package:movie_app/modules/movie_details/domain/entities/cast_entity.dart';

class CastModel {
  CastModel({this.name, this.characterName, this.urlSmallImage, this.imdbCode});

  CastModel.fromJson(dynamic json) {
    name = json['name'];
    characterName = json['character_name'];
    urlSmallImage = json['url_small_image'];
    imdbCode = json['imdb_code'];
  }

  CastEntity toEntity() {
    return CastEntity(
      name: name ?? '',
      characterName: characterName ?? '',
      urlSmallImage: urlSmallImage ?? '',
    );
  }

  String? name;
  String? characterName;
  String? urlSmallImage;
  String? imdbCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['character_name'] = characterName;
    map['url_small_image'] = urlSmallImage;
    map['imdb_code'] = imdbCode;
    return map;
  }
}
