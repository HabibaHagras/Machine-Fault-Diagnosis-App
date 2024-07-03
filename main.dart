import 'package:flutter/material.dart';
import 'package:flutter_application_2/FetchUserData/views/Home/Home.dart';
import 'package:flutter_application_2/FetchUserData/views/account/accountscreen.dart';
import 'package:flutter_application_2/Auth/views/Switch.dart';
import 'package:flutter_application_2/constants/text_strings.dart';
// import 'package:flutter_application_2/freg.dart';
import 'package:flutter_application_2/get_started_screen/getstarted.dart';
import 'Auth/views/login family/sign in/Sign_in.dart';
import 'units/theme/theme.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: RAppTheme.lightTheme,
      darkTheme: RAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home:rSwitch() ,


    );
  }
}

