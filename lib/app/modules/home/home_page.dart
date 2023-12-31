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
        centerTitle: true,
        title: Text('Music Play'),
        backgroundColor: Colors.black,
      ),

      backgroundColor: Colors.black,

      body: FutureBuilder<List<MusicaModel>>(
        builder: (context, constructor) {
          future: store.musicList;
          switch (constructor.data) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              if (constructor.hasData) {
                return buildList(constructor.data);
              } else {
                return Container();
              }
              break;
            default:
              return Container();
          }
        },
        future: null,
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
      itemCount: 10,
      itemBuilder: (_, int index) {
        return ListTile(
          onTap: () => Modular.to
              .pushNamed('/Player', arguments: 'assets/images/Linkinpark.jpg'),
          leading: Image.asset('assets/images/Linkinpark.jpg'),
          title: Text('Live in texas'),
          subtitle: Text('Linkin Park'),
          contentPadding: EdgeInsets.all(15),
        );
      },
    );
  }
}
