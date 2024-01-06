// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerStore on PlayerStoreBase, Store {
  Computed<String>? _$totalTimeComputed;

  @override
  String get totalTime =>
      (_$totalTimeComputed ??= Computed<String>(() => super.totalTime,
              name: 'PlayerStoreBase.totalTime'))
          .value;
  Computed<Future<String>>? _$timeProgressComputed;

  @override
  Future<String> get timeProgress => (_$timeProgressComputed ??=
          Computed<Future<String>>(() => super.timeProgress,
              name: 'PlayerStoreBase.timeProgress'))
      .value;
  Computed<double>? _$progressDurationComputed;

  @override
  double get progressDuration => (_$progressDurationComputed ??=
          Computed<double>(() => super.progressDuration,
              name: 'PlayerStoreBase.progressDuration'))
      .value;

  late final _$valueAtom =
      Atom(name: 'PlayerStoreBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$audioPlayerAtom =
      Atom(name: 'PlayerStoreBase.audioPlayer', context: context);

  @override
  AudioPlayer get audioPlayer {
    _$audioPlayerAtom.reportRead();
    return super.audioPlayer;
  }

  @override
  set audioPlayer(AudioPlayer value) {
    _$audioPlayerAtom.reportWrite(value, super.audioPlayer, () {
      super.audioPlayer = value;
    });
  }

  late final _$musicPlayingAtom =
      Atom(name: 'PlayerStoreBase.musicPlaying', context: context);

  @override
  bool get musicPlaying {
    _$musicPlayingAtom.reportRead();
    return super.musicPlaying;
  }

  @override
  set musicPlaying(bool value) {
    _$musicPlayingAtom.reportWrite(value, super.musicPlaying, () {
      super.musicPlaying = value;
    });
  }

  late final _$audioDurationAtom =
      Atom(name: 'PlayerStoreBase.audioDuration', context: context);

  @override
  Duration get audioDuration {
    _$audioDurationAtom.reportRead();
    return super.audioDuration;
  }

  @override
  set audioDuration(Duration value) {
    _$audioDurationAtom.reportWrite(value, super.audioDuration, () {
      super.audioDuration = value;
    });
  }

  late final _$timeToMusicAtom =
      Atom(name: 'PlayerStoreBase.timeToMusic', context: context);

  @override
  Duration get timeToMusic {
    _$timeToMusicAtom.reportRead();
    return super.timeToMusic;
  }

  @override
  set timeToMusic(Duration value) {
    _$timeToMusicAtom.reportWrite(value, super.timeToMusic, () {
      super.timeToMusic = value;
    });
  }

  late final _$PlayMusicAsyncAction =
      AsyncAction('PlayerStoreBase.PlayMusic', context: context);

  @override
  Future<void> PlayMusic(MusicaModel bands) {
    return _$PlayMusicAsyncAction.run(() => super.PlayMusic(bands));
  }

  late final _$PlayerStoreBaseActionController =
      ActionController(name: 'PlayerStoreBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$PlayerStoreBaseActionController.startAction(
        name: 'PlayerStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTimeToMusic(Duration d) {
    final _$actionInfo = _$PlayerStoreBaseActionController.startAction(
        name: 'PlayerStoreBase.changeTimeToMusic');
    try {
      return super.changeTimeToMusic(d);
    } finally {
      _$PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
audioPlayer: ${audioPlayer},
musicPlaying: ${musicPlaying},
audioDuration: ${audioDuration},
timeToMusic: ${timeToMusic},
totalTime: ${totalTime},
timeProgress: ${timeProgress},
progressDuration: ${progressDuration}
    ''';
  }
}
