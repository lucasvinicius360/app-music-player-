import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart'
    show ActionController, Atom, AtomSpyReporter, Store, action, observable;
import 'package:music_player/app/models/music_model.dart';
import 'package:music_player/app/repositories/music_repository.dart';
import 'package:audioplayers/audioplayers.dart';

part 'player_store.g.dart';

class PlayerStore = PlayerStoreBase with _$PlayerStore;

abstract class PlayerStoreBase with Store {
  final MusicRepository musicRepository = MusicRepository();

  // final MusicaModel bands = new MusicaModel()

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @observable
  AudioPlayer audioPlayer = new AudioPlayer();

  @observable
  bool musicPlaying = false;

  @action
  Future<void> PlayMusic(MusicaModel bands) async {
    if (bands != null) {
      if (!musicPlaying) {
        audioPlayer.play(UrlSource(bands.url_musica));
        musicPlaying = true;
      } else {
        musicPlaying = false;
        audioPlayer.pause();
      }
    }
  }
}
