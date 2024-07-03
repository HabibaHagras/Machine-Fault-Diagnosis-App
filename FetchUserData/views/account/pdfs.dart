import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

Future<String> _readone() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String textone="";
  try {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('D:/f/Results/HorizontalMisalignment.pdf');
    textone = await file.readAsString();
    await prefs?.setString('HorizontalMisalignment', textone);

  } catch (e) {
    print("Couldn't read file");
  }
  return textone;
}