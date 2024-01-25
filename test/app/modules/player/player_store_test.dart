import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/app/modules/player/player_store.dart';
import 'package:music_player/app/repositories/band_reposytory.dart';
 
void main() {
  late PlayerStore store;

  setUpAll(() {
    var i;
    store = PlayerStore(i.get<BandRepository>());
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}