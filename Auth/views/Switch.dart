import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/Auth/controllers/Switch/SwitchController.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class rSwitch extends StatefulWidget {
  @override
  State<rSwitch> createState() => _rSwitchState();
}

class _rSwitchState extends State<rSwitch> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SwitchController _switchController = Get.put(SwitchController());





  @override
  void initState() {
    _switchController.Swittching();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          // body:Column(children: [
          //   _switchController.switching(),
          // ],)

      );
}}
