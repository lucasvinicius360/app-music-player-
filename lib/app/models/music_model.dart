import 'package:json_annotation/json_annotation.dart';

part 'music_model.g.dart';

@JsonSerializable()
class MusicaModel {
  @JsonKey(name: 'id')
  String id;
  String name_band;
  String url_image;
  String url_musica;
  String name_music;
  String category;

  MusicaModel({
    required this.id,
    required this.name_band,
    required this.url_image,
    required this.url_musica,
    required this.name_music,
    required this.category,
  });

  factory MusicaModel.fromJson(Map<String, dynamic> json) => _$MusicaModelFromJson(json);
  Map<String, dynamic> toJsom() => _$MusicaModelToJson(this);
}
