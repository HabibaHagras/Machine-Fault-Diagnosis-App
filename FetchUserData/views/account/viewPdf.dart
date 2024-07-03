import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/FetchUserData/controllers/Result/ResultController.dart';
import 'package:flutter_application_2/FetchUserData/controllers/fetchcontrools.dart';
import 'package:flutter_application_2/Auth/controllers/accessPoint/login_controller.dart';
// import 'package:flutter_application_2/oldOnes/Home.dart';
import 'package:flutter_application_2/Auth/views/logout/loged.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:image/image.dart';

class viewPdf extends StatelessWidget {
  late int i;
  @override
//   State<viewPdf> createState() => _viewPdfState();
// }

// class _viewPdfState extends State<viewPdf> {
  viewPdf({
    Key? key,
    required this.i});
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ResultController _resultController = Get.put(ResultController());

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: rBasicColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "View Pdf",
          style: TextStyle( 
            fontSize: 20,
            fontFamily: 'Arial',
           ),
        ),
      ),
      body: FutureBuilder(
        future: _resultController.getResult(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                body:

                    // SfPdfViewer.memory(base64Decode(snapshot.data!.response![0].pdf.toString()))
                    SfPdfViewer.network(
                        snapshot.data!.response![i].pdfUrl.toString()
                        // 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'
                        ));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return Container(
                  height: h*.9,
                  child:
                    const Center(
                      child: const CircularProgressIndicator(
                        color: rBasicColor,
                        strokeWidth: 3,
                      ),
                      
                    ),
                  
                );;
        },
      ),
    );
  }
}
