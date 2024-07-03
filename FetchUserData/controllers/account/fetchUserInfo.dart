import 'dart:convert';

import 'package:flutter_application_2/Auth/controllers/accessPoint/refreshToken_Controller.dart';

import 'package:flutter_application_2/FetchUserData/models/Account/user_Infoo.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../../Auth/controllers/api/api_endpoint.dart';

class FetchUserDataController extends GetxController {
  refreshToken_Controller refreshToken = Get.put(refreshToken_Controller());

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<user_Infoo>fetchUserData() async {
    final SharedPreferences? prefs = await _prefs;
    final accessToken = prefs?.get('accessToken');
    final response = await http
        .get(Uri.parse(ApiEndPoints.baseUrl+'user'), headers: {
      'Content-Type':'application/json',
      'Authorization': 'Bearer $accessToken'

    });

    if (response.statusCode == 200) {

      return user_Infoo.fromJson( jsonDecode(response.body))  ;


    }
    else if(response.statusCode == 401) {
      print("REfreeeeeeeeeeeeeeeeeeeeeeshed");
      refreshToken.refreshToken();
      return fetchUserData();
    }
    else {

      throw Exception('Failed to load album');

    }
  }
}
