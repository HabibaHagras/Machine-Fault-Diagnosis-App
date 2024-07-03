import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/FetchUserData/controllers/Home/HomeFetchController.dart';
import 'package:flutter_application_2/FetchUserData/views/account/viewPdf.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/colors.dart';

class HomeItem extends StatelessWidget {
  int i;
  String name;
  String section;
  String image;

  HomeItem({
    Key? key,
    required this.i,
    required this.name,
    required this.image,
    required this.section,
  }) : super(key: key);
  FetchHomeController _fetchHomeController = Get.put(FetchHomeController());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 7,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*-------------------------------العنوان------------------------ */
          Text(name,
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 3,),

          /*------------------------------------المحتوي---------------------------- */
          Text(section,
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 10,
            
          )),
          Container(
            margin: EdgeInsets.only(top: 7),
            width: double.infinity,
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                /*-----------------------------الصورة---------------------------------------- */
                  fit: BoxFit.cover, image: NetworkImage(image)),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              
            ),
          ),
        ],
      ),
    );
  }
}

