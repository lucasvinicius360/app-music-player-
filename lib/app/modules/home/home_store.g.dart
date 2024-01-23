// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
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

  late final _$bandsFutureAtom =
      Atom(name: 'HomeStoreBase.bandsFuture', context: context);

  @override
  ObservableFuture<List<MusicaModel>> get bandsFuture {
    _$bandsFutureAtom.reportRead();
    return super.bandsFuture;
  }

  @override
  set bandsFuture(ObservableFuture<List<MusicaModel>> value) {
    _$bandsFutureAtom.reportWrite(value, super.bandsFuture, () {
      super.bandsFuture = value;
    });
  }

  late final _$findAllAsyncAction =
      AsyncAction('HomeStoreBase.findAll', context: context);

  @override
  Future<ObservableFuture<List<MusicaModel>>> findAll() {
    return _$findAllAsyncAction.run(() => super.findAll());
  }

  @override
  String toString() {
    return '''
counter: ${counter},
bandsFuture: ${bandsFuture}
    ''';
  }
}
