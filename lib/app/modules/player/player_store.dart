import 'package:mobx/mobx.dart' show ActionController, AsyncAction, Atom, AtomSpyReporter, ObservableFuture, Store, action, observable;
import 'package:music_player/app/models/music_model.dart';
import 'package:music_player/app/repositories/band_reposytory.dart';


part 'player_store.g.dart';

class PlayerStore = PlayerStoreBase with _$PlayerStore;

abstract class PlayerStoreBase with Store {
  @observable
  int value = 0;

  // @observable
  // MusicaModel banda = MusicaModel();

  final BandRepository bandRepository;
  PlayerStoreBase(this.bandRepository) {
    // findMusic(String id);
  }


  @observable
  late ObservableFuture<MusicaModel> music = ObservableFuture.value([] as MusicaModel);

  
  @action
  void increment() {
    value++;
  }

  
  @action
  Future<ObservableFuture<MusicaModel>> findMusic(String id) async {
    music = ObservableFuture(bandRepository.findById(id) as Future<MusicaModel>);
    print(music.value);
    return music;
  }

  @observable
  int faixa = 0;

  
}
