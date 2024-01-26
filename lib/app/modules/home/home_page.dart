import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/app/models/music_model.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
    store.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Music Play',
          style: GoogleFonts.orbitron(
            // fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 0, 244, 235),
            shadows: [
              Shadow(
                offset: Offset(4.0, 3.0),
                color: Color.fromARGB(255, 255, 69, 7),
                blurRadius: 5.0,
              ),
            ],
          ),
        ),
        // backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 1, bottom: 40),
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            color: Colors.black,
            // ignore: prefer_const_constructors
            image: DecorationImage(
                image: AssetImage("assets/images/hands.jpg"),
                fit: BoxFit.cover,
                opacity: 1.6)),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "It's a Great Day for listen to music",
                    style: GoogleFonts.orbitron(
                      color: const Color.fromARGB(255, 102, 102, 102),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 95, 95, 95),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Find Your Band",
                      hintStyle: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<MusicaModel>>(
                    future: store.bandsFuture,
                    builder: (context, data) {
                      switch (data.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );

                        case ConnectionState.done:
                          if (data.hasData) {
                            return ListBuild(data.data);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        default:
                          return CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView ListBuild(List<MusicaModel>? data) {
    return ListView.builder(
      itemCount: data?.length,
      itemBuilder: (_, int index) {
        var band = data?[index];
        return ListTile(
          onTap: () => Modular.to.pushNamed('/Player', arguments: band),
          leading: Container(
              width: 100,
              child: Image.network(
                '${band?.link_image}',
                fit: BoxFit.contain,
              )),
          title: Text(
            '${band?.name_music}',
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            '${band?.name_band}',
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          contentPadding: EdgeInsets.all(15),
        );
      },
    );
  }
}
