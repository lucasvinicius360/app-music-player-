import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_store.dart';


class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Music Play'),
        backgroundColor: Colors.black,
      ),

      backgroundColor: Colors.black,

      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, int index) {
          return ListTile(
            onTap: () => Modular.to.pushNamed('/Player', arguments: 'assets/images/img2.jpg'),
            leading: Image.asset('assets/images/img2.jpg'),
            title: Text('Live in texas'),
            subtitle: Text('Linkin Park'),
            contentPadding: EdgeInsets.all(15),
          );
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
}
