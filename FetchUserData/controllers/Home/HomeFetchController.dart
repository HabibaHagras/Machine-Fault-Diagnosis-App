import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/controllers/accessPoint/refreshToken_Controller.dart';
//the model
import 'package:flutter_application_2/FetchUserData/models/Pro_user.dart';
//the model

import 'package:flutter_application_2/FetchUserData/models/Home/home_infooo.dart';
// import 'package:flutter_application_2/oldOnes/Home.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../../Auth/controllers/api/api_endpoint.dart';

class FetchHomeController extends GetxController {
  refreshToken_Controller refreshToken = Get.put(refreshToken_Controller());
  late Uint8List _byteData;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();




Future<home_infooo> getHome() async {
  final response = await http
      .get(Uri.parse(ApiEndPoints.baseUrl+'HomeSection'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // setState(() {
    //   _byteData = response.bodyBytes;
    // });
    return home_infooo.fromJson( jsonDecode(response.body))  ;
    //  return jsonEncode(body) ;

  }
  else if(response.statusCode == 401) {

    return getHome();
  }
  else {
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
