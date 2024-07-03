import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final lightTheme = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    primaryColor: Colors.blueGrey.shade300,
 appBarTheme: const AppBarTheme(
   iconTheme: IconThemeData(color: Colors.black),
actionsIconTheme: IconThemeData(color: Colors.black),
   backgroundColor: Colors.transparent,
   titleTextStyle: TextStyle(color: Colors.black) ,
    ),
    dividerColor: Colors.white,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll<Color>(
            Color.fromARGB(255, 50, 130, 184),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          )),

    ),
    // textTheme: te
  );

  final darkTheme = ThemeData.dark().copyWith(
    // primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.white) ,

      // backgroundColor: Color.fromARGB(255, 115, 100, 215),
    ),
    dividerColor: Colors.white54,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll<Color>(
            Color.fromARGB(255, 50, 130, 184),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          )),
    ),
  );
  final _getStorage = GetStorage();

  final _darkThemeKey = 'isDarkTheme';
  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);

    saveThemeData(!isSavedDarkMode());
  }
}
