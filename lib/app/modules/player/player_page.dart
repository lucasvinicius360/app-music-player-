// ignore_for_file: prefer_const_constructors

import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter_advanced_seekbar/flutter_advanced_seekbar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_seekbar/seekbar/seekbar.dart';
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
    store.audioPlayer.onPositionChanged
        .listen((d) => store.changeTimeToMusic(d));
    print(store.progressDuration);
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
      body: Observer(builder: (_) {
        return Column(
          children: <Widget>[
            buildImageHeader(),
            builNameMusic(),
            buildProgressBar(),
            buildButtons(),
          ],
        );
      }),
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
    String state1 = "";
    int progress1 = store.progressDuration.toInt();
    return Observer(builder: (_) {
      return Column(
        children: <Widget>[
          Container(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.only(left: 35, right: 35, top: 30),
            // ignore: prefer_const_constructors
            child: Observer(builder: (_) {
              print('${store.progressDuration} <<======');
              return AdvancedSeekBar(
                Color(0xffeeeff3),
                10,
                Colors.blue,
                fillProgress: true,
                seekBarStarted: () {
                  setState(() {
                    state1 = "starting";
                  });
                },
                seekBarProgress: (v) {
                  setState(() {
                    state1 = " seeking";
                    progress1 = store.progressDuration.toInt();
                  });
                },
                seekBarFinished: (v) {
                  setState(() {
                    state1 = " finished";
                    progress1 = store.progressDuration.toInt();
                  });
                },
              );
            }),
          ),
          Container(
            padding: EdgeInsets.only(left: 35, right: 35, top: 6),
            child: Observer(builder: (_) {
              // debugPrint(store.timeInTime);
              return Row(
                children: <Widget>[
                  Text(store.timeInTime),
                  Expanded(
                    child: Container(),
                  ),
                  Text(store.totalTime)
                ],
              );
            }),
          )
        ],
      );
    });
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
                Icons.skip_previous,
                size: 30,
                // ignore: prefer_const_constructors
                color: Color.fromARGB(255, 33, 243, 145),
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
                _buildIcon(),
                // store.musicPlaying ? Icons.pause_circle_outlined : Icons.play_circle_outlined,
                size: 30,
                color: Color.fromARGB(255, 87, 181, 63),
              ),
              onPressed: () {
                store.PlayMusic(widget.bands);
              },
            ),
          ),
          SizedBox(
            width: 86, // Ajuste o valor conforme necessário
            child: ElevatedButton(
              child: Icon(
                Icons.skip_next,
                size: 30,
                color: Color.fromARGB(255, 43, 252, 1),
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

  IconData? _buildIcon() {
    if (store.musicPlaying) {
      return Icons.pause_circle_outlined;
    } else {
      return Icons.play_circle_outlined;
    }
  }
}
