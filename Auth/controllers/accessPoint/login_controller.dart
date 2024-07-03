import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/views/login%20family/sign%20in/Sign_in.dart';
import 'package:flutter_application_2/Auth/controllers/api/api_endpoint.dart';

import 'package:flutter_application_2/FetchUserData/views/Home/Home.dart';
import 'package:flutter_application_2/FetchUserData/views/account/accountscreen.dart';
// import 'package:flutter_application_2/oldOnes/Home.dart';
import 'package:flutter_application_2/bottom%20navy/Navigation_Bar.dart';
import 'package:flutter_application_2/constants/text_strings.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class LoginController extends GetxService {
  static late final TextEditingController emailController =
      TextEditingController();
  static late final TextEditingController passController =
      TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences logindata;
  late bool newuser;
  // String accessToken =
  // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJTdWIiOiJhMDljYWMzMy02NGU3LTQxYTgtYTBmNC04NTJkYjRmNjI4ZTIiLCJuYW1lIjoiYWJ1c2FsYWgiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJVc2VyIiwiZXhwIjoxNjc4NzUxMTE3fQ.otlDfM0sIgS8DYmb_bbGtgCEZ-JzCBSBIIo4kBqLfxU";
  // late String refresh_token;
  static String BASE_URL = 'http://192.168.1.4:5000/';

  Future<void> login() async {
    var headers = {
      'Content-Type': 'application/json',
      // 'authorization' : 'Bearer $accessToken',
    };
    //  _getStorage.write("login",headers);

    try {
      // http://10.0.2.2:5000/api/login

      var url = Uri.parse('https://192.168.1.65:7164/api/login');
      // ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);

      // Uri.parse("http://localhost:5000/api/login").replace(host: "192.168.1.10");
// Uri.parse("http://192.168.1.4:5000/api/login")

      Map<String, String> body = {
        'email': emailController.text.trim(),
        'password': passController.text.toString(),
      };
      var response = await Dio().post(
        ApiEndPoints.baseUrl+"login",
        data: jsonEncode(body),
      );
      // json.encode({
      //   'email': emailController.text.trim().toString(),
      //   'password': passController.text.toString(),

      // })
      // var response = await Dio().postUri(url, data:  jsonEncode(body)) ;
      // await http.post(url, body: jsonEncode(body), headers: headers);

      // Uri.http("/login"
      // Uri.http("192.168.1.10:5000","api/login")
      // Uri.parse('http://10.0.2.2:5000/api/login')
      // print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
      // Get.off(() => Home());
      //
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLoggedIn", true);
        print("Successed Login !!!!!!");

        final json = jsonDecode(jsonEncode(response.data));
        debugPrint(json?.toString());

        if (json['status'] == true) {
          var accessToken = json['response']['accessToken'];
          var refreshToken = json['response']['refreshToken'];
          var role = json['response']['role'];

          // var PASS = json['response']['password'];

          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('accessToken', accessToken);
          await prefs?.setString('refreshToken', refreshToken);
          await prefs?.setString('role', role);

          // await prefs?.setString('password', PASS);

          // emailController.clear();
          // passController.clear();
          Get.off(() => navy());
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
              title: Text('Login Failed', 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black),),
              contentPadding: EdgeInsets.all(20),
              children: [
                Text('Your email or password is incorrect.\nPlease try again',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,)
              ],
            );
          });
      print(error);
    }
  }

  void check_if_already_login() async {
    final SharedPreferences? prefs = await _prefs;

    // logindata = await SharedPreferences.getInstance();
    // newuser = (logindata.getBool('login') ?? true);
    newuser = (await prefs?.getBool('isLoggedIn') ?? false);

    print(newuser);
    if (newuser == true) {
      // Get.to(() => Home());
      Get.off(() => navy());
    }
  }

  // Future<void> fetchdata() async {
  //   final SharedPreferences? prefs = await _prefs;
  //   var token = (await prefs?.get('token'));
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     // 'Authorization': 'Bearer $token'
  //   };
  //
  //   try {
  //     var url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1");
  //
  //     http.Response response = await http.get(url);
  //     print(jsonDecode(response.body));
  //     final extracted = jsonDecode(response.body) as Map<String, dynamic>;
  //     extracted.forEach((user, data) {
  //       userId:
  //       data['userId'];
  //       id:
  //       data['id'];
  //       title:
  //       data['title'];
  //     });
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }

  void _handleDioResponse(dynamic response) {}
  void _handleDioError(dynamic error) {}
}
