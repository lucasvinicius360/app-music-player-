import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/app/models/music_model.dart';
import 'package:music_player/app/modules/player/player_store.dart';
import 'package:flutter/material.dart';
import 'package:music_player/app/repositories/band_reposytory.dart';

class PlayerPage extends StatefulWidget {
  final MusicaModel music;

  PlayerPage({Key? key, required this.music}) : super(key: key);
  @override
  PlayerPageState createState() => PlayerPageState();
}

class PlayerPageState extends State<PlayerPage> {
  final PlayerStore playerStore = PlayerStore(BandRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playerStore.findMusic(widget.music.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          widget.music.name_band,
          style: GoogleFonts.orbitron(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, bottom: 40),
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
              color: Colors.black,
              // ignore: prefer_const_constructors
              image: DecorationImage(
                  image: AssetImage("assets/images/hands.jpg"),
                  fit: BoxFit.cover,
                  opacity: 1.6)),
          child: FutureBuilder(
            builder: (context, snapshot) {
              return Observer(
                builder: (_) {
                  return Column(
                    children: <Widget>[
                      buildImageHeader(),
                      builNameMusic(),
                      buildProgressBar(),
                      buildButtons(),
                    ],
                  );
                },
              );
            },
            future: playerStore.bandsFuture,
          ),
        ),
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
                image: NetworkImage(widget.music.link_image),
                fit: BoxFit.cover),
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
            '${widget.music.name_music}',
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          child: Text(
            '${widget.music.name_band}',
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
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
              Text(
                '0:15',
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                '03:15',
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  buildButtons() {
    return Observer(
      builder: (_) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // Adicione esta linha para distribuir os botões igualmente no espaço disponível
            children: <Widget>[
              leftButton(),
              playButton(),
              rightButton(),
            ],
          ),
        );
      }
    );
  }

  SizedBox rightButton() {
    return SizedBox(
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
        );
  }

  Observer playButton() {
    return Observer(
      builder: (_) {
        return SizedBox(
              width: 86, // Ajuste o valor conforme necessário
              child: ElevatedButton(
                child: Icon(
                 playerStore.musicPlaying ? Icons.pause_circle_filled_sharp : Icons.play_circle_outlined ,
                  size: 30,
                  color: Colors.limeAccent.shade700,
                ),
                onPressed: () {
                  print('play_circle_outlined');
                  playerStore.playerMusic(widget.music);
                },
              ),
            );
      }
    );
  }

  SizedBox leftButton() {
    return SizedBox(
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
        );
  }
}
