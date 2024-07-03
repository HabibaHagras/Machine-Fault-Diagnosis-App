import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/controllers/accessPoint/refreshToken_Controller.dart';
//the model
import 'package:flutter_application_2/FetchUserData/models/Pro_user.dart';
//the model

import 'package:flutter_application_2/FetchUserData/models/Result/result_Modell.dart';
// import 'package:flutter_application_2/oldOnes/Home.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../../Auth/controllers/api/api_endpoint.dart';

class ResultController extends GetxController {
  refreshToken_Controller refreshToken = Get.put(refreshToken_Controller());

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<result_Modell> getResult() async {
    final SharedPreferences? prefs = await _prefs;
    final accessToken = prefs?.get('accessToken');

    final response = await http.get(
        Uri.parse(ApiEndPoints.baseUrl+'result'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        });
    // Map <String,String>  body  = {
    //   'refreshToken': refreshToken.toString()
    // };

    if (response.statusCode == 200) {

      // If the server did return a 200 OK response,
      // then parse the JSON.
      // setState(() {
      //   _byteData = response.bodyBytes;
      // });
      return result_Modell.fromJson(jsonDecode(response.body));
      //  return jsonEncode(body) ;
    } else if (response.statusCode == 401) {
      print("REfreeeeeeeeeeeeeeeeeeeeeeshed result");
      refreshToken.refreshToken();

      return getResult();
    } else if (response.statusCode == 500) {
      print("50000000000000");
            return getResult();

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //  final SharedPreferences? prefs_refresh = await _prefs;
      //  final newAcess=prefs_refresh?.get('accessToken');
      // final  accessToken=newAcess;
      throw Exception('Failed to load album');
      // return fetchAlbum();
    }
  }
}
