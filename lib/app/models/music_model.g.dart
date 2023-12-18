// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicaModel _$MusicaModelFromJson(Map<String, dynamic> json) => MusicaModel(
      id: json['_id'] as String,
      name_band: json['name_band'] as String,
      url_image: json['url_image'] as String,
      url_musica: json['url_musica'] as String,
      name_music: json['name_music'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$MusicaModelToJson(MusicaModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name_band': instance.name_band,
      'url_image': instance.url_image,
      'url_musica': instance.url_musica,
      'name_music': instance.name_music,
      'category': instance.category,
    };
