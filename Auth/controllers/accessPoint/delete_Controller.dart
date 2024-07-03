import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//the model


// import 'package:flutter_application_2/oldOnes/Home.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../views/login family/sign in/Sign_in.dart';
import '../api/api_endpoint.dart';

class DeleteController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future deleteUser() async {
    final SharedPreferences? prefs = await _prefs;
    final accessToken = prefs?.get('accessToken');
    var response = await
    Dio().delete(ApiEndPoints.baseUrl+"user",

        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
     }   )

    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print('DELETTTTTTTTTTTED SUCESSSSSSED ');
      prefs?.setBool("isLoggedIn", false);
      final json = jsonDecode(jsonEncode(response.data));
      debugPrint(json?.toString());

      if (json['status'] == true) {
        // var accessToken = json['response']['accessToken'];
        

        // Get.off(() => Signin());
      } else if (json['errorNumber'] != 0) {
        throw jsonDecode(response.data)['message'];
      }

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
