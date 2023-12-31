// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$testAtom = Atom(name: 'HomeStoreBase.test', context: context);

  @override
  ObservableFuture<List<MusicaModel>> get test {
    _$testAtom.reportRead();
    return super.test;
  }

  @override
  set test(ObservableFuture<List<MusicaModel>> value) {
    _$testAtom.reportWrite(value, super.test, () {
      super.test = value;
    });
  }

  late final _$counterAtom =
      Atom(name: 'HomeStoreBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$musicListAtom =
      Atom(name: 'HomeStoreBase.musicList', context: context);

  @override
  ObservableList<MusicaModel> get musicList {
    _$musicListAtom.reportRead();
    return super.musicList;
  }

  @override
  set musicList(ObservableList<MusicaModel> value) {
    _$musicListAtom.reportWrite(value, super.musicList, () {
      super.musicList = value;
    });
  }

  late final _$findAllAsyncAction =
      AsyncAction('HomeStoreBase.findAll', context: context);

  @override
  Future<List<MusicaModel>> findAll() {
    return _$findAllAsyncAction.run(() => super.findAll());
  }

  late final _$incrementAsyncAction =
      AsyncAction('HomeStoreBase.increment', context: context);

  @override
  Future<void> increment() {
    return _$incrementAsyncAction.run(() => super.increment());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void find() {
    final _$actionInfo =
        _$HomeStoreBaseActionController.startAction(name: 'HomeStoreBase.find');
    try {
      return super.find();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
test: ${test},
counter: ${counter},
musicList: ${musicList}
    ''';
  }
}
