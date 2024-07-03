import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/views/login%20family/sign%20in/Sign_in.dart';
import 'package:flutter_application_2/bottom navy/Navigation_Bar.dart';
import 'package:flutter_application_2/get_started_screen/getstarted.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchController extends GetxService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences logindata;
  late bool switching;

  Future<void> Swittching()async {

    final SharedPreferences? prefs = await _prefs;


    switching= (await prefs?.getBool('isLoggedIn') ?? false);

    print("switching :::::::::::::: ${switching}");
    if (switching == true) {
      // Get.to(() => Home());
      Get.off(() => navy());
    }else{
      Get.off(()=>getStart());
    }
  }}
