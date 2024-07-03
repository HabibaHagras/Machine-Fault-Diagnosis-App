import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/FetchUserData/views/account/resultPage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' hide Response, FormData, MultipartFile;

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:file_picker/file_picker.dart';

import '../accessPoint/refreshToken_Controller.dart';
import '../api/api_endpoint.dart';

class audiopicker_Controller extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  refreshToken_Controller refreshToken = Get.put(refreshToken_Controller());

  FilePickerResult? result;

  late final ImagePicker picker = ImagePicker();
  XFile? audio;

  Future Postrecord() async {
    final SharedPreferences? prefs = await _prefs;
    final accessToken = prefs?.get('accessToken');
    final Record = prefs?.get('Record');

    try {
      final url = Uri.parse('http://10.0.2.2:5000/api/result');

      var request = http.MultipartRequest('POST',
          Uri.parse(ApiEndPoints.baseUrl+'result'));

      //for token
      request.headers.addAll({'Authorization': 'Bearer $accessToken'});

      // for image and videos and files

      request.files
          .add(await http.MultipartFile.fromPath("Record", Record.toString()));

      //for completeing the request
      var response = await request.send();

      //for getting and decoding the response into json format
      var responsed = await http.Response.fromStream(response);
      // final responseData = json.decode(responsed.body);
      var status = response.statusCode;
      await prefs?.setInt('status', 400);

      if (response.statusCode == 200) {
        final SharedPreferences prefs = await _prefs;
        await prefs?.setInt('status', 200);

        print("Successed POSTED RECORD UPLOADING  !!!!!!");
        Get.off(() => ResultScreen());
        if (responsed.body.isNotEmpty) {
          json.decode(responsed.body);
        print(json.decode(responsed.body));
        }
        // print(responseData);
      } else if (response.statusCode == 500) {
        
        print("ERROR 505000000000000000000000000000");
        // print(responseData);
      } 
          else if (response.statusCode == 401) {
        print("REfreeeeeeeeeeeeeeeeeeeeeeshed");
        refreshToken.refreshToken();
        return Postrecord();
      }
      else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    } catch (error) {
      // Get.off(() => Signin());

      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
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
      await prefs?.setString('Record', file!.path);
    } else {
      print("No file selected");
    }
  }
}
