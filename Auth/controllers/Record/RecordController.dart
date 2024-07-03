import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/Auth/controllers/accessPoint/refreshToken_Controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_endpoint.dart';


// multi(String path) async {
//   try {
//     var request = http.MultipartRequest(
//         'POST', Uri.parse('https://music-identify.p.rapidapi.com/identify'));
//     request.files.add(await http.MultipartFile.fromPath('field', path));
//     var response = await request.send();
//     var responed = await http.Response.fromStream(response);
//     final ResponseData = jsonDecode(responed.body);
//     print("oooooooooooooooooooooooooooooooooooobject");
//   } catch (e) {
//     print("Exception Caught: $e");
//   }
//
// }
// uploadAudi(String title, File file) async{
//
//   var request = http.MultipartRequest("POST",Uri.parse("http://10.0.2.2:5000/api/result"));
//
//   request.fields['title'] = "Record";
//   request.headers['Authorization'] = "";
//
//   var audio = http.MultipartFile.fromBytes('Record', (await rootBundle.load(file.toString())).buffer.asUint8List(),);
//
//   request.files.add(audio);
//
//   var response = await request.send();
//
//   var responseData = await response.stream.toBytes();
//
//   var result = String.fromCharCodes(responseData);
//
//
//   print(result);
//
//
//
// }
class RecordController extends GetxController {
  refreshToken_Controller refreshToken = Get.put(refreshToken_Controller());

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future multipartProdecudre() async {
    final SharedPreferences? prefs = await _prefs;
    final accessToken = prefs?.get('accessToken');
    try {
      //for multipartrequest
      var request = http.MultipartRequest(
          'POST', Uri.parse(ApiEndPoints.baseUrl+'result'));

      //for token
      request.headers.addAll({'Authorization': 'Bearer $accessToken'});

      //for image and videos and files

      request.files.add(
          await http.MultipartFile.fromPath("Record", "/data/user/0/com.example.flutter_application_2/cache/audio8444903022214301434.m4a")


      );


      //for completeing the request
      var response = await request.send();

      //for getting and decoding the response into json format
      var responsed = await http.Response.fromStream(response);
      final responseData = json.decode(responsed.body);


      if (response.statusCode == 200) {
        print("SUCCESS");
        print(responseData);
      }
      else if (response.statusCode == 401) {
        print("REfreeeeeeeeeeeeeeeeeeeeeeshed");
        refreshToken.refreshToken();
        return multipartProdecudre();
      }
      else if (response.statusCode == 500) {


        print("ERROR");
        print(responseData);

      }
    } catch (error) {
      print(error);
    }


  }

  Future getRecord() async {
    // var img = await picker.pickImage(source: media);
    // result = await FilePicker.platform.pickFiles(allowMultiple: true );
    // audio = result;
    // final SharedPreferences? prefs = await _prefs;
    // await prefs?.setString('Record', result!.path);
    // result?.files.forEach((element) {
    //   print(element.name);
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path.toString());
      final SharedPreferences? prefs = await _prefs;
      await prefs?.setString('Record',file!.path);
    } else {
      print("No file selected");
    }

  }
}


