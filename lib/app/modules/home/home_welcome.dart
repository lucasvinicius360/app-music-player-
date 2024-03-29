import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/app/modules/home/home_page.dart';


class HomeWelcome extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 100, bottom: 40),
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            color: Colors.black,
            // ignore: prefer_const_constructors
            image: DecorationImage(
                image: AssetImage("assets/images/hands.jpg"),
                fit: BoxFit.cover,
                opacity: 1.6)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Music',
                style: GoogleFonts.orbitron(
                    fontSize: 70,
                    color: Color.fromARGB(255, 0, 244, 235),
                    shadows: [
                      Shadow(
                        offset: Offset(4.0, 3.0),
                        color: Color.fromARGB(255, 255, 69, 7),
                        blurRadius: 5.0,
                      ),
                    ]),
              ),
              Column(
                children: [
                  Text(
                    'Listen To Music Now',
                    style: GoogleFonts.orbitron(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  InkWell(
                    splashColor: Colors.black,
                    onTap: () {
                      print('Dev de Jesus');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Ink(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 69, 7),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Let's Get It Started",
                          style: GoogleFonts.orbitron(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              shadows: [
                                Shadow(
                                  offset: Offset(4.0, 3.0),
                                  color: Color.fromARGB(255, 0, 244, 235),
                                  blurRadius: 5.0,
                                ),
                              ]),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
