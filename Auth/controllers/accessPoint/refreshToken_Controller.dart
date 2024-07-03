import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_2/oldOnes/Home.dart';
import 'package:flutter_application_2/Auth/views/logout/loged.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../views/login family/sign in/Sign_in.dart';
import '../api/api_endpoint.dart';

class refreshToken_Controller extends GetxService {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  Future<void> refreshToken() async {
    var headers = {
      'Content-Type': 'application/json',
      // 'authorization' : 'Bearer $accessToken',
    };
    try {
      final SharedPreferences? prefs = await _prefs;
      final refreshToken = prefs?.get('refreshToken');
            final role = prefs?.get('role');

      Map <String,String>  body  = {
        'refreshToken': refreshToken.toString(),
        'role':role.toString()
      };
      var response = await
      Dio().post(ApiEndPoints.baseUrl+"refresh",
        data: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print("Refreshed Nowwwwwwwwwwwwwww ");

        final json = jsonDecode(jsonEncode(response.data));
        debugPrint(json?.toString());

        if (json['status'] == true) {
          var refreshaccessToken = json['response']['accessToken'];
          var refreshrefreshToken = json['response']['refreshToken'];

          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('accessToken', refreshaccessToken);
          await prefs?.setString('refreshToken', refreshrefreshToken);
        } else if (json['errorNumber'] != 0) {
          throw jsonDecode(response.data)['message'];
        }
      } else {
        throw jsonDecode(response.data)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.off(() => Signin());
      final SharedPreferences? prefs = await _prefs;

      prefs?.setBool("isLoggedIn", false);

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

}
