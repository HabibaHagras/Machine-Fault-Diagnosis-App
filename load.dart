import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/bottom%20navy/Navigation_Bar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/colors.dart';

class load extends StatefulWidget {
  const load({Key? key}) : super(key: key);

  @override
  State<load> createState() => _loadState();
}

class _loadState extends State<load> {
  DateTime specificDate = DateTime.now()
      .add(const Duration(seconds: 1)); //change based on your date.

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _todayIsTheDay();
    });
  }

  _todayIsTheDay() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (DateTime.now().difference(specificDate).inSeconds ==
          Duration.zero.inSeconds) {
        timer.cancel();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => navy(h:2),
          ),
        );
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
      color:Colors.white ,
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,

        children: [
          Center(
              child:CircularProgressIndicator(
                color: rBasicColor,
              )
            ),
            SizedBox(height: 20,),
            Text("loading",
              style: GoogleFonts.varelaRound(
                fontSize: 13,
                color: rBasicColor
              ),
               
            )
        ],
      ),

      // FlutterLogo(size: MediaQuery.of(context).size.height)
    ));
  }
  }