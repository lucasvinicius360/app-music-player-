// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicaModel _$MusicaModelFromJson(Map<String, dynamic> json) => MusicaModel(
      id: json['id'] as String,
      name_band: json['name_band'] as String,
      link_image: json['link_image'] as String,
      link_music: json['link_music'] as String,
      name_music: json['name_music'] as String,
      genero: json['genero'] as String,
    );

Map<String, dynamic> _$MusicaModelToJson(MusicaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_band': instance.name_band,
      'link_image': instance.link_image,
      'link_music': instance.link_music,
      'name_music': instance.name_music,
      'genero': instance.genero,
    };
