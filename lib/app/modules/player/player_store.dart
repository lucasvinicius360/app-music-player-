import 'package:mobx/mobx.dart' show ActionController, Atom, AtomSpyReporter, Store, action, observable;


part 'player_store.g.dart';

class PlayerStore = PlayerStoreBase with _$PlayerStore;

abstract class PlayerStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
