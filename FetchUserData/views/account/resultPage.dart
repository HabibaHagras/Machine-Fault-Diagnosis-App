import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/FetchUserData/controllers/Result/ResultController.dart';
import 'package:flutter_application_2/FetchUserData/views/account/resultiteam.dart';
import 'package:flutter_application_2/FetchUserData/views/account/viewPdf.dart';
import 'package:flutter_application_2/bottom%20navy/Navigation_Bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:pdf_render/pdf_render.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_application_2/constants/colors.dart';
import 'package:intl/intl.dart';

class ResultScreen extends StatelessWidget {
  //ourbook
  ResultScreen({super.key});
  ResultController _resultController = Get.put(ResultController());

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height ;
    return WillPopScope(
      onWillPop: 
      ()async{ return false; },
      child: Scaffold(
        //ourbook
          appBar: AppBar(
          backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            title: Text(
              "Last Results",
              style: Theme.of(context).textTheme.headline3,
            ),
            leading: IconButton(
              onPressed: () {
                Get.off(navy(h: 2,));
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(15),
            child: FutureBuilder(
                future: _resultController.getResult(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.response!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BookItem(
                      i: index,
                      name: snapshot.data!.response![index].name.toString(),
                      rate: snapshot.data!.response![index].rate!,
                      feedback:
                          snapshot.data!.response![index].feedback.toString(),
                      pdfUrl: snapshot.data!.response![index].pdfUrl.toString(),
                      id: snapshot.data!.response![index].id.toString(),
                      createdAt:snapshot.data!.response![index].createdAt.toString() ,
    
                    );
    
                        // resultChild(list: h, num: index);
                      },
                    );
                  }
                  ;
                  return Container(
                    height: h*.9,
                    child:
                      const Center(
                        child: const CircularProgressIndicator(
                          color: rBasicColor,
                          strokeWidth: 3,
                        ),
                        
                      ),
                    
                  );
                }),
          )),
    );
  }
}

