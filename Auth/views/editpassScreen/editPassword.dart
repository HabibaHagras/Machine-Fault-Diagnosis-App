// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/views/login%20family/labels/EmailLabel.dart';
import 'package:flutter_application_2/Auth/views/login%20family/labels/NameLabel.dart';
import 'package:flutter_application_2/Auth/views/login%20family/labels/PassLabel.dart';
import 'package:flutter_application_2/Auth/views/login%20family/labels/PhoneLabel.dart';
import 'package:flutter_application_2/Auth/views/login%20family/labels/RepassLabel.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:flutter_application_2/constants/images_strings.dart';
// import 'package:flutter_proj_1/Themes/theme_service.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import '../../controllers/Pass/EditPass_controller.dart';
import '../login family/labels/newpassLabel.dart';




class changePass extends StatefulWidget {
  const changePass({super.key});

  @override
  State<changePass> createState() => _changePassState();
}

class _changePassState extends State<changePass> {

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  bool val = true;
  EditPassController editController = Get.put(EditPassController());

  @override


  @override
  Widget build(BuildContext context) {
    final Rheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: rWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text("Change Password ",
          style: Theme.of(context).textTheme.headline3,
        ),
        leading: IconButton(
          onPressed: () { Navigator.pop(context);},
          icon: const Icon(Icons.arrow_back_ios, 
            size: 20, 
            color: Colors.black,
          ),
        ),

      ),
      body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
                children: [
                  Form(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text("Current Password",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headline2,),
                      ),
                      SizedBox(
                        height: 43.39,
                        width: double.infinity,
                        child: PassLabel(
                            passController: editController.passController),
                      ),
                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text("New Password",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headline2,),
                      ),
                      SizedBox(
                        height: 43.39,
                        width: double.infinity,
                        child: newPassLabel(
                            newpassController: editController.newpassController),
                      ),
                      const SizedBox(height: 15,),
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 8),
                      //   child: Text("Confirm Password",
                      //     style: Theme.of(context).textTheme.headline2,),
                      // ),
                      // SizedBox(
                      //   height: 43.39,
                      //   width: double.infinity,
                      //   key: _form,
                      //   // margin: const EdgeInsets.all(20),
                      //   child: RepassLabel(
                      //       repassController: registerationController.repassController),
                      // ),
                      SizedBox(height: Rheight > 700? 400 :145,),
                      
                      Positioned(
                        bottom: 20,
                        child: SizedBox(
                            height: 44,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                editController.editPass();

                                // // registerationController.registeration();
                                // _form.currentState!.validate();
                              },
                              child: Text("Save changes",
                                style: Theme.of(context).textTheme.headline6 
                              ),
                            )
                          ),
                      ),
                      
      
                    ],
                  )),
      
                ],
              ),
            ),
          ),
      
        );
        // )
        
  }

  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}