import 'package:dio/dio.dart';
import 'package:music_player/app/models/music_model.dart';

class BandRepository {
  // Future<List<MusicaModel>> findMusic() async {
  //   var dio = Dio();
  //   return await dio
  //       .get('http://10.0.0.102:3000/api/getMusic')
  //       .then((res) =>
  //           (res.data)
  //               .map<MusicaModel>((json) => MusicaModel.fromJson(json))
  //               .toList());
  // }

  Future<List<MusicaModel>> findMusic() async {
    var dio = Dio();
    try {
      var res = await dio.get('http://10.0.0.102:3000/api/getMusic');
      if (res.statusCode == 200) {
        // print(res.data.toString());
        var list = (res.data as List).map((json) {
          print(json);
          return MusicaModel.fromJson(json);
        }).toList();
        return list;
      } else {
        print('Erro no servidor: ${res.statusCode}');
        return [];
      }
    } catch (e) {
      print('Erro na requisição: $e');
      return [];
    }
  }

  Future<List<MusicaModel>> findById(String id) async {
    var dio = Dio();
    try {
      var res = await dio.get('http://10.0.0.102:3000/api/getMusicById/$id');
      if (res.statusCode == 200) {
        // print(res.data.toString());
        var list = (res.data as List).map((json) {
          print(json);
          return MusicaModel.fromJson(json);
        }).toList();
        return list;
      } else {
        print('Erro no servidor: ${res.statusCode}');
        return [];
      }
    } catch (e) {
      print('Erro na requisição: $e');
      return [];
    }
  }


 
  
}
