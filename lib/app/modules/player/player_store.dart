import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart'
    show
        ActionController,
        AsyncAction,
        Atom,
        AtomSpyReporter,
        Computed,
        ObservableFuture,
        Store,
        action,
        computed,
        observable;
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

  @observable
  Duration audioDuration = Duration();
  @observable
  Duration timeToMusic = Duration();

  @computed
  String get timeProgress => timeToMusic != null
      ? '0${timeToMusic.inMinutes.remainder(60)}:${timeToMusic.inSeconds.remainder(60) < 10 ? '0${timeToMusic.inSeconds.remainder(60)}' : timeToMusic.inSeconds.remainder(60)}'
      : '00:00';

  @action
  changeTimeToMusic(Duration d) {
    // print(d);
    timeToMusic = d;
  }

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
    // print('bandsFuture == > ${bandsFuture.toString()}');
    return bandsFuture;
  }

  @observable
  int faixa = 0;

  @observable
  AudioPlayer audioPlayer = AudioPlayer();

  @observable
  bool musicPlaying = false;

  @computed
  String get totalTime => audioDuration != null
      ? '0${audioDuration.inMinutes.remainder(60)}:${audioDuration.inSeconds.remainder(60) < 10 ? '0${audioDuration.inSeconds.remainder(60)}' : audioDuration.inSeconds.remainder(60)}'
      : "00:00";

  @computed
  double get progressDuration => audioDuration != null
      ? (audioDuration.inSeconds > 0
          ? timeToMusic.inSeconds.toDouble() * 100 / audioDuration.inSeconds
          : 0)
      : 0;

  Future<void> playerMusic(MusicaModel band) async {
    if (music != null) {
      if (!musicPlaying) {
        audioPlayer.pause();

        await audioPlayer.play(UrlSource(band.link_music));

        await Future.delayed(Duration(milliseconds: 200));

        Duration? duration = await audioPlayer.getDuration();
        if (audioDuration != null) {
          this.audioDuration = duration!;
        }
        musicPlaying = true;
      } else {
        musicPlaying = false;
        audioPlayer.pause();
      }
    }
  }

  @action 
  setTimeMusic(double value) {
    // print('${value.toInt()} <== setTimeMusic (value)');
    // Duration newPosition =
    //     Duration(seconds: (value.toInt() * audioDuration.inSeconds));

    // print('${newPosition} <== setTimeMusic');
    // audioPlayer.seek(newPosition);

    audioPlayer.seek(
        Duration(seconds: (value).toInt()));


  }
}
