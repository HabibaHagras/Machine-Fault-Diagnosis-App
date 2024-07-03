import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/views/login%20family/sign%20in/sign_in_form.dart';
import 'package:flutter_application_2/Auth/views/login%20family/sign%20up/SignupScreen.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:flutter_application_2/constants/images_strings.dart';


import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter_application_2/Auth/controllers/accessPoint/login_controller.dart';

// import 'package:flutter_application_2/oldOnes/Home.dart';
import 'package:flutter_application_2/Auth/views/login%20family/reset%20pass/Reset.dart';

import 'package:flutter_application_2/Auth/views/login%20family/labels/EmailLabel.dart';
import 'package:flutter_application_2/Auth/views/login%20family/labels/PassLabel.dart';

import 'package:flutter_application_2/Auth/views/logout/loged.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:flutter_proj_1/theme.dart';
// import 'package:flutter_proj_1/Themes/theme_service.dart';

// import 'package:flutter_try_1/src/Auth/utils/utils.dart';

import '../../../../../../constants/text_strings.dart';



class Signin extends StatefulWidget {
  @override
  _Signin createState() => _Signin();
}

class _Signin extends State<Signin> {
  bool val = true;
  final GlobalKey<FormState> formKey = GlobalKey();

  late List data;
  LoginController loginController = Get.put(LoginController());
  final _userdata = GetStorage();
  final _storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    loginController.check_if_already_login();

  }

  @override

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Rheight = size.height;

    return WillPopScope(
      onWillPop: 
      ()async{ return false; },
      child: Scaffold(
        backgroundColor: rWhiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(rSignin, style: Theme.of(context).textTheme.headline3,),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20,Rheight > 700? 20 :0,20,20 ),
            child:Column(
              children:[
                SizedBox(
                  height: Rheight > 700? Rheight*.29 : Rheight*.25,
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    child: Image(image: AssetImage('assets/logo.png')),),),
                signinform(loginController: loginController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",
                      style: TextStyle(
                        fontSize: 14,
                        color: rhint1Color),
                    ),
                    Builder(builder: (cont) {
                      return TextButton(
                          onPressed: () {
                            Get.to( () => SignupScreen());
                          },
                          child: const Text("Sign up ",
                              style: TextStyle(fontSize: 14, color: rHintP2Color)
                          )
                      );
                    }),
                  ],
                ),
              ]),
           ),
                    
        ),
      ),
    );
  }
}







 


