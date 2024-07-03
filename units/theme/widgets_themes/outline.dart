
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/colors.dart';
import '../../../constants/sizes.dart';


class ROutlinedButtonTheme {

  ROutlinedButtonTheme._();

    static final lightOutlinedButtonTheme =OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor:  rBasicColor,
      side: BorderSide(color:rBasicColor),
      padding: EdgeInsets.symmetric(vertical:rButtonHeight),)
    );


    static final darkOutlinedButtonTheme =OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor:  rBasicColor,
        side: BorderSide(color:rBasicColor),
        padding: EdgeInsets.symmetric(vertical:rButtonHeight),)
    );



}