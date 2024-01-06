// ignore_for_file: unnecessary_null_comparison

import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart'
    show
        ActionController,
        AsyncAction,
        Atom,
        AtomSpyReporter,
        Computed,
        Store,
        action,
        computed,
        observable;
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

  @observable
  Duration audioDuration = Duration();

  @observable 
  Duration timeToMusic = Duration();

  @computed
  String get totalTime => audioDuration != null
      ? '${audioDuration.inMinutes.remainder(60)}:${audioDuration.inSeconds.remainder(60)}'
      : '0:00';

  @computed
  String get timeInTime => timeToMusic != null
      ? '${timeToMusic.inMinutes.remainder(60)}:${timeToMusic.inSeconds.remainder(60)}'
      : '0:00';

  @computed
  Future<String> get timeProgress async => timeToMusic.inMinutes != 0
      ? '${timeToMusic.inMinutes.remainder(60)}:${timeToMusic.inSeconds.remainder(60)}'
      : '0:00';

  @computed
  double get progressDuration => audioDuration != null
      ? (audioDuration.inSeconds > 0
          ? timeToMusic.inSeconds.toDouble() * 1 / audioDuration.inSeconds
          : 0)
      : 0;

  @action
  changeTimeToMusic(Duration d) {
    timeToMusic = d;
    return timeToMusic;
  }

  @action
  Future<void> PlayMusic(MusicaModel bands) async {
    if (bands != null) {
      if (!musicPlaying) {
        audioPlayer.play(UrlSource(bands.url_musica));

        // Aguarda 400 milissegundos antes de imprimir a duração
        await Future.delayed(Duration(milliseconds: 400));

        // Obtém a duração da música
        Duration? duration = await audioPlayer.getDuration();

        // Verifica se a duração não é nula antes de atribuir à variável audioDuration
        if (duration != null) {
          print('$duration   <======= 3');
          audioDuration = duration;
        } else {
          print('Duração da música é nula.');
          // Lide com a situação em que a duração é nula (por exemplo, atribua um valor padrão ou trate de outra forma)
        }

        musicPlaying = true;
      } else {
        musicPlaying = false;
        audioPlayer.pause();
      }
    }
  }
}
