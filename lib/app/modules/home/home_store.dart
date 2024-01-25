import 'package:mobx/mobx.dart';
import 'package:music_player/app/models/music_model.dart';
import 'package:music_player/app/repositories/band_reposytory.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final BandRepository bandRepository;

  @observable
  int counter = 0;

  HomeStoreBase(this.bandRepository);

  Future<void> increment() async {
    counter = counter + 1;
  }

  @observable
  late ObservableFuture<List<MusicaModel>> bandsFuture =
      ObservableFuture.value([]);

  @action
  Future<ObservableFuture<List<MusicaModel>>> findAll() async {
    bandsFuture = ObservableFuture(bandRepository.findMusic());
    print(bandsFuture.value);
    return bandsFuture;
  }
}
