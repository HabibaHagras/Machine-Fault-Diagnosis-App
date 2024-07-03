import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/views/login%20family/sign%20in/Sign_in.dart';
import 'package:flutter_application_2/Auth/views/logout/loged.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../api/api_endpoint.dart';


class LogoutController extends GetxService {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  Future<void> logout() async {
    var headers = {
      'Content-Type': 'application/json',
      // 'authorization' : 'Bearer $accessToken',
    };
    try {
      var url = Uri.parse('http://10.0.2.2:5000/api/logout');
      final SharedPreferences? prefs = await _prefs;
      final refreshToken = prefs?.get('refreshToken');
      Map <String,String>  body  = {
        'refreshToken': refreshToken.toString()
      };
      var response = await
      Dio().post(ApiEndPoints.baseUrl+"logout",
        data: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print("LOGED OUTTTTTTTTTTTTTTT");

        final json = jsonDecode(jsonEncode(response.data));
        debugPrint(json?.toString());

        if (json['status'] == true) {
          // var accessToken = json['response']['accessToken'];
          final SharedPreferences? prefs = await _prefs;
          prefs?.clear();

          Get.off(() => Loged());
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
