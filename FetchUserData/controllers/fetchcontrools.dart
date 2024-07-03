import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/controllers/accessPoint/refreshToken_Controller.dart';
//the model
import 'package:flutter_application_2/FetchUserData/models/Pro_user.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../Auth/controllers/api/api_endpoint.dart';

class FetchDataController extends GetxController {
  refreshToken_Controller refreshToken = Get.put(refreshToken_Controller());

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<Pro_user>fetchAlbum() async {
    final SharedPreferences? prefs = await _prefs;
    final accessToken = prefs?.get('accessToken');
    final response = await http
            .get(Uri.parse(ApiEndPoints.baseUrl+'user'), headers: {
     'Content-Type':'application/json',
     // 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJTdWIiOiJhMDljYWMzMy02NGU3LTQxYTgtYTBmNC04NTJkYjRmNjI4ZTIiLCJuYW1lIjoiYWJ1c2FsYWgiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJVc2VyIiwiZXhwIjoxNjc5MDAwNjM5fQ.M8dsO2mq2RXKpVnaqzgNGfdLIKPWXRO0l4Q58D2hTok'
      'Authorization': 'Bearer $accessToken'

    });
// https://dummyjson.com/products/1
///////////////////
//  http://restapi.adequateshop.com/api/users/7075
//  headers: {
// 'Authorization': 'Bearer <token>'
// 2f5b41b5-1482-4bbf-946d-a1acbb31280a
// devolper:87964820-8e27-4cbc-a924-230a53b7631e
//  }
////////////////////
        // .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

//  Map body = {
//         'userId':userId,
//         'id': id ,
//         'title':title
//       };
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Pro_user.fromJson( jsonDecode(response.body))  ;
      //  return jsonEncode(body) ;

    }
    else if(response.statusCode == 401) {
      print("REfreeeeeeeeeeeeeeeeeeeeeeshed");
      refreshToken.refreshToken();
       return fetchAlbum();
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
