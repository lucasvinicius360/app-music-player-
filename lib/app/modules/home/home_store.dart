import 'package:mobx/mobx.dart';
import 'package:music_player/app/models/music_model.dart';
import 'package:music_player/app/repositories/music_repository.dart';

// Importe a classe MusicRepository

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  // Crie uma instância de MusicRepository
  final MusicRepository musicRepository = MusicRepository();

  @observable
  ObservableFuture<List<MusicaModel>> test;

  // Construtor
  HomeStoreBase()
      : test = ObservableFuture<List<MusicaModel>>(Future.value([]));

  @observable
  int counter = 0;

  @observable
  ObservableList<MusicaModel> musicList = ObservableList<MusicaModel>();

  ObservableList<MusicaModel> musics = ObservableList.of([]);

  @action
  void find() {
    test = ObservableFuture(musicRepository.findMusics());
  }

  @action
  Future<List<MusicaModel>> findAll() async {
    List<MusicaModel> musics = await musicRepository.findMusics();
    return musics;
  }

  @action
  Future<void> increment() async {
    counter = counter + 1;
  }

  // Adicione um método para buscar músicas
  //   @action
  //   Future<void> fetchMusics() async {
  //     try {
  //       // Chame o método findMusics() do MusicRepository
  //       List<MusicaModel> musics = await musicRepository.findMusics();

  //       // Atualize a lista de músicas
  //       musicList.clear();
  //       musicList.addAll(musics);
  //     } catch (e) {
  //       // Trate erros, se necessário
  //       print("Erro ao buscar músicas: $e");
  //     }
  //   }

  //   // Adicione um método para buscar músicas por banda
  //   @action
  //   Future<void> fetchMusicsByBand(String bands) async {
  //     try {
  //       // Chame o método findBands() do MusicRepository
  //       List<MusicaModel> musics = await musicRepository.findBands(bands);

  //       // Atualize a lista de músicas
  //       musicList.clear();
  //       musicList.addAll(musics);
  //     } catch (e) {
  //       // Trate erros, se necessário
  //       print("Erro ao buscar músicas por banda: $e");
  //     }
  //   }
}
