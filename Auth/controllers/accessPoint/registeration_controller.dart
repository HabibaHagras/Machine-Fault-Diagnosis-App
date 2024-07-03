import 'package:dio/dio.dart';
import 'package:flutter_application_2/FetchUserData/views/Home/Home.dart';
import 'package:flutter_application_2/bottom%20navy/Navigation_Bar.dart';
// import 'package:flutter_application_2/oldOnes/Home.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../api/api_endpoint.dart';

class RegisterationController extends GetxController {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController lastnameController = TextEditingController();

  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController passController = TextEditingController();
  late TextEditingController ageController = TextEditingController();

  //the storage
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> registeration() async {
    // ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+'register');
     Map<String, String>  body = {
        "FristName": nameController.text,
        "LastName": lastnameController.text,
        'email': emailController.text.trim(),
        'password': passController.text,
        'phone': phoneController.text,
        'age': ageController.text
      };

     var response = await Dio().post(
        ApiEndPoints.baseUrl+"register",
        data: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(jsonEncode(response.data));
        if (json['status'] == true) {
          var accessToken = json['response']['accessToken'];
          print(accessToken);
          final SharedPreferences? prefs = await _prefs;

          await prefs?.setString('accessToken', accessToken);
          // nameController.clear();
          // emailController.clear();
          // passController.clear();
          // repassController.clear();
          // phoneController.clear();
          Get.off(() => navy());
        } 
        else if (response.statusCode == 400) {
        print("500000000000000000000000");
      }else 
        {
          throw jsonDecode(response.data)["message"] ?? "Unknown Error Occured";
        }
      } else {
        throw jsonDecode(response.data)["Message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
