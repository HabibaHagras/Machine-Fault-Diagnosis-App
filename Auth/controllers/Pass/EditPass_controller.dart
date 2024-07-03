import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/views/login%20family/sign%20in/Sign_in.dart';
import 'package:flutter_application_2/FetchUserData/models/Pro_user.dart';
import 'package:flutter_application_2/FetchUserData/views/account/accountscreen.dart';
import 'package:flutter_application_2/bottom%20navy/Navigation_Bar.dart';
import 'package:flutter_application_2/load.dart';
// import 'package:flutter_application_2/oldOnes/Home.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../api/api_endpoint.dart';

class EditPassController extends GetxService {
  late final TextEditingController newpassController = TextEditingController();
  late final TextEditingController passController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences logindata;
  late bool newuser;

  static String BASE_URL = 'http://192.168.1.4:5000/';

  Future editPass() async {
    final SharedPreferences? prefs = await _prefs;
    final accessToken = prefs?.get('accessToken');
    // final PASS = prefs?.get('password');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var url =
          Uri.parse('http://dcmotorproject-001-site1.atempurl.com/api/login');

      Map<String, dynamic> body = {
        'Password': passController.text.toString(),
        'NewPassword': newpassController.text.toString()
      };
      var response = await Dio().put(
          ApiEndPoints.baseUrl + "user/updatepassword",
          data: jsonEncode(body),
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken'
          }));

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        print("Successed reset !!!!!!");

        final json =
            jsonDecode(jsonEncode(response.data as Map<String, dynamic>));
        debugPrint(json?.toString());

        var accessToken = json['accessToken'];
        var refreshToken = json['refreshToken'];

        // final SharedPreferences? prefs = await _prefs;
        // await prefs?.setString('accessToken', accessToken);
        // await prefs?.setString('refreshToken', refreshToken);

        // passController.clear();
        Get.off(() => load());

        // return Pro_user.fromJson( jsonDecode(response.data))  ;
        // return Pro_user.fromJson( jsonDecode(response.data))  ;
      }
    } catch (error) {
      // Get.off(() => Signin());
      final SharedPreferences? prefs = await _prefs;

      // prefs?.setBool("isLoggedIn", false);

      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              // children: [Text(error.toString())],
              children: [Text("Done")],
            );
          });
      print(error);
    }
  }
}
