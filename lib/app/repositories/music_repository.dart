import 'package:music_player/app/models/music_model.dart';
import 'package:dio/dio.dart';

class MusicRepository {
  Future<List<MusicaModel>> findMusics() {
    var dio = Dio();

    return dio.get('http://10.0.0.102:3000/api/getMusics').then((value) => value
        .data
        .map<MusicaModel>((value) => MusicaModel.fromJson(value))
        .toList());
  }

  Future<List<MusicaModel>> findBands(String bands) {
    var dio = Dio();

    return dio.get('http://10.0.0.102:3000/api/forBands/$bands').then((value) =>
        value.data
            .map<MusicaModel>((value) => MusicaModel.fromJson(value))
            .toList());
  }

  // Future<List<MusicaModel>> findMusics() async {
  //   var dio = Dio();

  //   try {
  //     var response = await dio.get('http://10.0.0.102:3000/api/getMusics');

  //     if (response.statusCode == 200) {
  //       print(response.data[0]);
  //       // Verifique se os dados são uma lista antes de tentar mapear
  //       if (response.data[0]) {
  //         return (response.data[0])
  //             .map<MusicaModel>((value) => MusicaModel.fromJson(value))
  //             .toList();
  //       } else {
  //         throw Exception('Os dados recebidos não são uma lista.');
  //       }
  //     } else {
  //       throw Exception('Falha na requisição: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Erro na requisição: $e');
  //     throw e;
  //   } finally {
  //     dio.close();
  //   }
  // }
}
