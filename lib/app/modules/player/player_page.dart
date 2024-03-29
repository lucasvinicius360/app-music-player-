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
    playerStore.audioPlayer.onPositionChanged
        .listen((event) => playerStore.changeTimeToMusic(event));

    print('${playerStore.progressDuration.toDouble()}  <== progressDuration');
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
            color: Color.fromARGB(255, 0, 244, 235),
            shadows: [
              Shadow(
                offset: Offset(4.0, 3.0),
                color: Color.fromARGB(255, 255, 69, 7),
                blurRadius: 5.0,
              ),
            ],
            fontSize: 27,
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
            image: widget.music.link_image != null
                ? _buildImageProvider(widget.music.link_image)
                : AssetImage("assets/images/hands.jpg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(2),
          boxShadow: [BoxShadow(color: Colors.grey.shade800, blurRadius: 10)],
        ),
      ),
    );
  }

  ImageProvider<Object> _buildImageProvider(dynamic link) {
    if (link is String) {
      return NetworkImage(link);
    } else {
      // Trate outros casos conforme necessário (pode lançar uma exceção, retornar outra imagem padrão, etc.)
      return AssetImage("assets/images/default.jpg");
    }
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

  Observer buildProgressBar() {
    return Observer(builder: (_) {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 35, right: 35, top: 30),
            child: Slider(
              value: playerStore.progressDuration.toDouble(),
              max: 100.0,
              activeColor: Color.fromARGB(255, 0, 244, 235),
              inactiveColor: Color.fromARGB(255, 255, 69, 7),
              label: '${playerStore.progressDuration}',
              onChanged: (double value) {
                // print(playerStore.progressDuration);
                print("Slider value changed: $value");
                playerStore.setTimeMusic(value);
                // playerStore.setTimeMusic(playerStore.progressDuration);
              },
            ),
          ),
          times()
        ],
      );
    });
  }

  Observer times() {
    return Observer(builder: (_) {
      return Container(
        padding: EdgeInsets.only(left: 35, right: 35, top: 6),
        child: Row(
          children: <Widget>[
            begingTime(),
            Expanded(
              child: Container(),
            ),
            finishTime()
          ],
        ),
      );
    });
  }

  Observer begingTime() {
    return Observer(builder: (_) {
      return Text(
        '${playerStore.timeProgress}',
        style: GoogleFonts.orbitron(
          color: Color.fromARGB(255, 0, 244, 235),
          shadows: [
            Shadow(
              offset: Offset(4.0, 3.0),
              color: Color.fromARGB(255, 255, 69, 7),
              blurRadius: 5.0,
            ),
          ],
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
      );
    });
  }

  Observer finishTime() {
    return Observer(builder: (_) {
      return Text(
        playerStore.totalTime,
        style: GoogleFonts.orbitron(
          color: Color.fromARGB(255, 0, 244, 235),
          shadows: [
            Shadow(
              offset: Offset(4.0, 3.0),
              color: Color.fromARGB(255, 255, 69, 7),
              blurRadius: 5.0,
            ),
          ],
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
      );
    });
  }

  buildButtons() {
    return Observer(builder: (_) {
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
    });
  }

  SizedBox rightButton() {
    return SizedBox(
      width: 86, // Ajuste o valor conforme necessário
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(
              255, 0, 244, 235), // Defina a cor de fundo desejada aqui
        ),
        child: Icon(
          Icons.fast_forward,
          size: 30,
          color: Color.fromARGB(255, 255, 69, 7),
        ),
        onPressed: () {
          print('Icons.fast_forward');
        },
      ),
    );
  }

  Observer playButton() {
    return Observer(builder: (_) {
      return SizedBox(
        width: 86, // Ajuste o valor conforme necessário
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(
                255, 0, 244, 235), // Defina a cor de fundo desejada aqui
          ),
          child: Icon(
            playerStore.musicPlaying
                ? Icons.pause_circle_filled_sharp
                : Icons.play_circle_outlined,
            size: 30,
            color: Color.fromARGB(255, 255, 69, 7),
          ),
          onPressed: () {
            print('play_circle_outlined');
            playerStore.playerMusic(widget.music);
          },
        ),
      );
    });
  }

  SizedBox leftButton() {
    return SizedBox(
      width: 86, // Ajuste o valor conforme necessário
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(
              255, 0, 244, 235), // Defina a cor de fundo desejada aqui
        ),
        child: Icon(
          Icons.fast_rewind,
          size: 35,
          color: Color.fromARGB(255, 255, 69, 7),
        ),
        onPressed: () {
          print('Icons.fast_rewind');
        },
      ),
    );
  }
}
