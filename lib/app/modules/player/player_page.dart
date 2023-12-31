import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:music_player/app/models/music_model.dart';
import 'package:music_player/app/modules/player/player_store.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  final MusicaModel bands;

  PlayerPage({Key? key, required this.bands}) : super(key: key);
  @override
  PlayerPageState createState() => PlayerPageState();
}

class PlayerPageState extends State<PlayerPage> {
  final PlayerStore store = new PlayerStore();

  @override
  void initState() {
    super.initState();
    // store.PlayMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(widget.bands.name_band),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          buildImageHeader(),
          builNameMusic(),
          buildProgressBar(),
          buildButtons(),
        ],
      ),
    );
  }

  Container buildImageHeader() {
    return Container(
      margin: EdgeInsets.only(left: 35, right: 35, top: 35, bottom: 35),
      child: Container(
        width: MediaQuery.of(this.context).size.width,
        height: 350,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.bands.url_image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade800, blurRadius: 10)
            ]),
      ),
    );
  }

  builNameMusic() {
    return Column(
      children: <Widget>[
        Container(
          child: Text(
            widget.bands.name_music,
            style: GoogleFonts.ptSansCaption(fontSize: 25),
          ),
        ),
        Container(
          child: Text(
            widget.bands.name_band,
            style: GoogleFonts.ptSansCaption(fontSize: 15),
          ),
        ),
      ],
    );
  }

  buildProgressBar() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 35, right: 35, top: 30),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey.shade500,
            valueColor:
                AlwaysStoppedAnimation<Color>(Colors.limeAccent.shade700),
            value: 0.5,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 35, right: 35, top: 6),
          child: Row(
            children: <Widget>[
              Text('0:15'),
              Expanded(
                child: Container(),
              ),
              Text('03:15')
            ],
          ),
        )
      ],
    );
  }

  buildButtons() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceEvenly, // Adicione esta linha para distribuir os botões igualmente no espaço disponível
        children: <Widget>[
          SizedBox(
            width: 86, // Ajuste o valor conforme necessário
            child: ElevatedButton(
              child: Icon(
                Icons.fast_rewind,
                size: 30,
                color: Colors.limeAccent.shade700,
              ),
              onPressed: () {
                print('Icons.fast_rewind');
              },
            ),
          ),
          SizedBox(
            width: 86, // Ajuste o valor conforme necessário
            child: ElevatedButton(
              child: Icon(
                store.musicPlaying
                    ? Icons.pause_circle_outlined
                    : Icons.play_circle_outlined,
                size: 30,
                color: Colors.limeAccent.shade700,
              ),
              onPressed: () {
                store.PlayMusic(widget.bands);
                print('play_circle_outlined');
              },
            ),
          ),
          SizedBox(
            width: 86, // Ajuste o valor conforme necessário
            child: ElevatedButton(
              child: Icon(
                Icons.fast_forward,
                size: 30,
                color: Colors.limeAccent.shade700,
              ),
              onPressed: () {
                print('Icons.fast_forward');
              },
            ),
          ),
        ],
      ),
    );
  }
}
