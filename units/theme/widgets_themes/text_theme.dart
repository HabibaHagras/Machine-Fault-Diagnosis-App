
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class RTextTheme {
  RTextTheme._();

  static TextTheme lightTextTheme =const TextTheme(
      headline1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold,color:rDarkColor),
      headline2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500,color:rTitlefieldColor),
      headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400,color:rHead1Color),
      headline4: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500,color:rHintFieldColor),
      headline5: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500,),
      headline6: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: rWhiteColor),
      bodyText1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal,color:rWhiteColor),
      bodyText2: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: rDarkColor),
      subtitle2: TextStyle(color: Colors.black54,fontSize: 24),
    );



  static TextTheme darkTextTheme = const TextTheme(
      headline1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold,color:rWhiteColor),
      headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700,color:rWhiteColor),
      headline3: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700,color:rWhiteColor),
      headline4: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600,color:rWhiteColor),
      headline5: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600,color:rWhiteColor),
      headline6: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: rWhiteColor),
      bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal,color:rWhiteColor),
      bodyText2: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: rWhiteColor),
      subtitle2: TextStyle(color:rWhiteColor,fontSize: 24,),
  );
}