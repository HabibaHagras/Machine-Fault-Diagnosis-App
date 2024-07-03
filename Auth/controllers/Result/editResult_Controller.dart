import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/controllers/accessPoint/refreshToken_Controller.dart';
import 'package:flutter_application_2/Auth/views/login%20family/sign%20in/Sign_in.dart';
import 'package:flutter_application_2/bottom%20navy/Navigation_Bar.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../../FetchUserData/views/Home/Home.dart';
import '../../../FetchUserData/views/account/resultPage.dart';
import '../api/api_endpoint.dart';

class EditResultController extends GetxController {
  refreshToken_Controller refreshToken = Get.put(refreshToken_Controller());
  static late final TextEditingController EditingFeedbackController =
      TextEditingController();
  static late final TextEditingController EditingRateController =
      TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future EditResult(id,rate) async {
    final SharedPreferences? prefs = await _prefs;
    final accessToken = prefs?.get('accessToken');
    Map<String, String> body = {
      "rate": rate.toString(),
      "feedback": EditingFeedbackController.text,
      "id":id.toString() ,
    };
    var response = await Dio().put(
        ApiEndPoints.baseUrl+"result",
        data: jsonEncode(body),
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        }));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print('Editing result SUCESSSSSSED ');
      // prefs?.setBool("isLoggedIn", false);
      final json = jsonDecode(jsonEncode(response.data));
      debugPrint(json?.toString());

      if (json['status'] == true) {
        // var accessToken = json['response']['accessToken'];
        // final SharedPreferences? prefs = await _prefs;
        // prefs?.clear();

        // Get.to(() => ResultScreen());
                // Get.to(() => navy());

      } else if (response.statusCode == 401) {

        print("REfreeeeeeeeeeeeeeeeeeeeeeshed");
        refreshToken.refreshToken();
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
