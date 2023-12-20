import 'package:music_player/app/models/music_model.dart';
import 'package:dio/dio.dart';

class MusicRepository {
  Future<List<MusicaModel>> findMusics() {
    var dio = Dio();

    return dio.get('http://localhost:3000/api/getMusics').then((value) => value
        .data
        .map<MusicaModel>((value) => MusicaModel.fromJson(value))
        .toList());
  }

   Future<List<MusicaModel>> findBands(String bands) {
    var dio = Dio();

    return dio.get('http://localhost:3000/api/forBands/$bands').then((value) => value
        .data
        .map<MusicaModel>((value) => MusicaModel.fromJson(value))
        .toList());
  }
}
