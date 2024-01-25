// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerStore on PlayerStoreBase, Store {
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

  late final _$musicAtom =
      Atom(name: 'PlayerStoreBase.music', context: context);

  @override
  ObservableFuture<MusicaModel> get music {
    _$musicAtom.reportRead();
    return super.music;
  }

  @override
  set music(ObservableFuture<MusicaModel> value) {
    _$musicAtom.reportWrite(value, super.music, () {
      super.music = value;
    });
  }

  late final _$faixaAtom =
      Atom(name: 'PlayerStoreBase.faixa', context: context);

  @override
  int get faixa {
    _$faixaAtom.reportRead();
    return super.faixa;
  }

  @override
  set faixa(int value) {
    _$faixaAtom.reportWrite(value, super.faixa, () {
      super.faixa = value;
    });
  }

  late final _$findMusicAsyncAction =
      AsyncAction('PlayerStoreBase.findMusic', context: context);

  @override
  Future<ObservableFuture<MusicaModel>> findMusic(String id) {
    return _$findMusicAsyncAction.run(() => super.findMusic(id));
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
  String toString() {
    return '''
value: ${value},
music: ${music},
faixa: ${faixa}
    ''';
  }
}
