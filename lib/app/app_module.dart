import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_player/app/repositories/band_reposytory.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => BandRepository())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];

}