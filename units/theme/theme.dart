
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:flutter_application_2/units/theme/widgets_themes/elevated.dart';
import 'package:flutter_application_2/units/theme/widgets_themes/outline.dart';
import 'package:flutter_application_2/units/theme/widgets_themes/text_theme.dart';

import 'package:google_fonts/google_fonts.dart';

class RAppTheme {

  RAppTheme._();
  static ThemeData lightTheme = ThemeData(
    primaryColor: rBasicColor,
    brightness: Brightness.light,
    textTheme: RTextTheme.lightTextTheme,
    outlinedButtonTheme: ROutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: RElevatedButtonTheme.lightElevatedButtonTheme,
    fontFamily: 'SFUIDisplay',
    
  );
  static ThemeData darkTheme = ThemeData(
    // // primarySwatch: Colors.yellow,
    brightness: Brightness.dark,
    textTheme: RTextTheme.darkTextTheme,
    outlinedButtonTheme: ROutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: RElevatedButtonTheme.darkElevatedButtonTheme,
    fontFamily: 'SFUIDisplay',

  );
}