import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_player/app/modules/home/home_welcome.dart';
import 'package:music_player/app/modules/player/player_module.dart';
import 'package:music_player/app/modules/player/player_page.dart';

import '../home/home_store.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomeWelcome()),
    
    ChildRoute('/Player', child: (_, args) => PlayerPage(url: args.data)),
    // Remova uma das rotas '/Player' para evitar duplicatas
  ];

  
}
