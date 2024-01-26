import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart' show ActionController, AsyncAction, Atom, AtomSpyReporter, ObservableFuture, Store, action, observable;
import 'package:music_player/app/models/music_model.dart';
import 'package:music_player/app/repositories/band_reposytory.dart';


part 'player_store.g.dart';

class PlayerStore = PlayerStoreBase with _$PlayerStore;

abstract class PlayerStoreBase with Store {
  @observable
  int value = 0;

  // @observable
  // MusicaModel banda;

  final BandRepository bandRepository;
  PlayerStoreBase(this.bandRepository) {
    // findMusic(String id);
  }


 @observable
 late ObservableFuture<MusicaModel?> music = ObservableFuture.value(null);


  
  @action
  void increment() {
    value++;
  }

  @observable
  late ObservableFuture<List<MusicaModel>> bandsFuture =
      ObservableFuture.value([]);

  
  @action
  Future<ObservableFuture<List<MusicaModel>>> findMusic(String id) async {
    bandsFuture = ObservableFuture(bandRepository.findById(id));
    print('bandsFuture == > ${bandsFuture.toString()}');
    return bandsFuture;
  }

  @observable
  int faixa = 0;

  @observable
  AudioPlayer audioPlayer = AudioPlayer();

  @observable
  bool musicPlaying = false;

  Future<void> playerMusic(MusicaModel band) async {
    if (music != null) {
      if (!musicPlaying) {
        await audioPlayer.play(UrlSource(band.link_music));
        musicPlaying = true;
      }else{
        musicPlaying = false;
        audioPlayer.pause();
      }
    }
  }

  
}
