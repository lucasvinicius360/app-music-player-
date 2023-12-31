import 'package:music_player/app/modules/player/player_page.dart';
import 'package:music_player/app/modules/player/player_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlayerModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PlayerStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => PlayerPage(bands: args.data,)),
  ];
}
