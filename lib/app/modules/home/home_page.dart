// ignore_for_file: prefer_const_constructors

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
    store.find();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Music Play'),
        backgroundColor: Colors.black,
      ),

      backgroundColor: Colors.black,

      body: FutureBuilder<List<MusicaModel>>(
        future: store.test,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            // ignore: constant_pattern_never_matches_value_type
            case ConnectionState.done:
              if (snapshot.hasData) {
                return buildList(snapshot.data);
              } else {
                return Container();
              }
              break;
            default:
              return Container();
          }
        },
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     store.increment();
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }

  ListView buildList(List<MusicaModel>? data) {
    return ListView.builder(
      itemCount: data?.length,
      itemBuilder: (_, int index) {
        var band = data?[index];

        return ListTile(
          onTap: () => Modular.to
              .pushNamed('/Player', arguments: band),
          leading: Container(
            width: 200,
            child: Image.network(band!.url_image,fit: BoxFit.contain,)),
          title: Text(band.name_music),
          subtitle: Text(band.name_band),
          contentPadding: EdgeInsets.all(19),
        );
      },
    );
  }
}
