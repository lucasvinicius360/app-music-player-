import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_player/app/modules/player/player_store.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  final String url;
   PlayerPage({Key? key, required this.url}) : super(key: key);
  @override
  PlayerPageState createState() => PlayerPageState();
}
class PlayerPageState extends State<PlayerPage> {
  // final PlayerStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(widget.url),
      ),

      backgroundColor: Colors.black,

      body: Column(
        children: <Widget>[
          Container(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              color: Color.fromARGB(255, 222, 0, 225),
             ),
          )
        ],
      ),
    );
  }
}