import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_player/app/modules/player/player_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute(Modular.initialRoute, module: PlayerModule()),
  ];

}