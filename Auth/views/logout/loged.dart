import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_application_2/Auth/views/login%20family/sign%20in/Sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class Loged extends StatefulWidget {
  @override
  State<Loged> createState() => _LogedState();
}

class _LogedState extends State<Loged> {
  @override
  @override
  Widget build(BuildContext context) {
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
            Text("loging out",
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
