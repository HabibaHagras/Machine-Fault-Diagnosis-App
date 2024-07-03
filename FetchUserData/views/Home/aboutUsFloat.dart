import 'package:flutter/material.dart';
import 'package:flutter_application_2/FetchUserData/views/Home/aboutus.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';

FloatingActionButton aboutUsFloat() {
    return FloatingActionButton.extended(
      onPressed: () => Get.to(rAboutUs()),
      icon: Icon(Icons.contactless),
      label: Text('About Us',
      style: TextStyle(
        fontSize: 10
      ),),
      backgroundColor: rBasicColor,
              
    );
  }
