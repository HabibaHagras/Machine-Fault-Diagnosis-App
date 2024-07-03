import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
//the model
import 'package:flutter_application_2/FetchUserData/models/Pro_user.dart';

import 'package:flutter_application_2/FetchUserData/views/account/accountscreen.dart';
import 'package:flutter_application_2/bottom%20navy/Navigation_Bar.dart';
import 'package:flutter_application_2/load.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' hide Response, FormData, MultipartFile;

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

import '../api/api_endpoint.dart';

class EditUserController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late TextEditingController EditingnameController = TextEditingController();
  // late TextEditingController emailController = TextEditingController();
  late TextEditingController EditemailController = TextEditingController();

  late TextEditingController EditingphoneController = TextEditingController();
  late TextEditingController EditingpassController = TextEditingController();
  late TextEditingController repassController = TextEditingController();
  late TextEditingController EditingageController = TextEditingController();
  late TextEditingController EditinglastnameController =
      TextEditingController();

  late final ImagePicker picker = ImagePicker();
  XFile? image;

  Future editUser() async {
    final SharedPreferences? prefs = await _prefs;
    final accessToken = prefs?.get('accessToken');
    final UserImage = prefs?.get('UserImage');

    try {
      var request = http.MultipartRequest('PUT',
          Uri.parse(ApiEndPoints.baseUrl+'user'));

      //for token
      request.headers.addAll({'Authorization': 'Bearer $accessToken'});

      // for image and videos and files

      request.files.add(await http.MultipartFile.fromString(
          "email", EditemailController.text.trim()));
      request.files.add(await http.MultipartFile.fromString(
          "age", EditingageController.text));
      request.files.add(await http.MultipartFile.fromString(
          "phone", EditingphoneController.text));
      request.files.add(await http.MultipartFile.fromString(
          "fristName", EditingnameController.text));
      request.files.add(await http.MultipartFile.fromString(
          "lastName", EditinglastnameController.text));
      request.files.add(
          await http.MultipartFile.fromPath("userImage", UserImage.toString()));

      //for completeing the request
      var response = await request.send();

      //for getting and decoding the response into json format
      var responsed = await http.Response.fromStream(response);
      final responseData = json.decode(responsed.body);

      if (response.statusCode == 200) {
        print("Successed editttttttttttttted !!!!!!");
        Get.off(() => load());
        print(responseData);
      } else if (response.statusCode == 500) {
        print("ERROR");
        print(responseData);
      } else {
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

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    image = img;
    print(img!.path);
    final SharedPreferences? prefs = await _prefs;
    await prefs?.setString('UserImage', img!.path);
  }
}
