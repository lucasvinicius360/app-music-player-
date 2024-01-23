import 'package:json_annotation/json_annotation.dart';

part 'music_model.g.dart';

@JsonSerializable()
class MusicaModel {
  @JsonKey(name: 'id')
  String id;
  String name_band;
  String link_image;
  String link_music;
  String name_music;
  String genero;

  MusicaModel({
    required this.id,
    required this.name_band,
    required this.link_image,
    required this.link_music,
    required this.name_music,
    required this.genero,
  });

  factory MusicaModel.fromJson(Map<String, dynamic> json) => _$MusicaModelFromJson(json);
  Map<String, dynamic> toJsom() => _$MusicaModelToJson(this);
}
