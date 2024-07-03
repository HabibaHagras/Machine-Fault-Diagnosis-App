
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:flutter_application_2/constants/sizes.dart';


class RElevatedButtonTheme {
  RElevatedButtonTheme._();

  static final lightElevatedButtonTheme =ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0, 
      // shape: RoundedRectangleBorder(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      // shape: border,
      foregroundColor:  rWhiteColor,
      backgroundColor: rBasicColor,
      side: BorderSide(color:rBasicColor),
      // padding: EdgeInsets.symmetric(vertical:1),
    ), 
  );



  static final darkElevatedButtonTheme =ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0, 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      foregroundColor:  rWhiteColor,
      backgroundColor: rBasicColor,
      side: BorderSide(color:rBasicColor),
      padding: EdgeInsets.symmetric(vertical:10),
    ), 
  );
}