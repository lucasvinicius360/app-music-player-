import 'package:music_player/app/modules/player/player_page.dart';
import 'package:music_player/app/modules/player/player_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_player/app/repositories/band_reposytory.dart';

class PlayerModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PlayerStore(i.get<BandRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => PlayerPage( music: args.data,)),
  ];
}
