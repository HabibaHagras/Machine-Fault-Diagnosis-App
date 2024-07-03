// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/controllers/accessPoint/registeration_controller.dart';
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

import '../labels/LastNameLabel.dart';
import '../labels/ageLabel.dart';
import '../sign in/Sign_in.dart';

// import '/theme.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // late TextEditingController nameController;
  // late TextEditingController emailController;
  // late TextEditingController phoneController;
  // late TextEditingController passController;
  // late TextEditingController repassController;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  bool val = true;
  RegisterationController registerationController =
      Get.put(RegisterationController());
  @override
  // void initState() {
  //   nameController = TextEditingController();
  //   emailController = TextEditingController();
  //   phoneController = TextEditingController();
  //   passController = TextEditingController();
  //   repassController = TextEditingController();

  // super.initState();
  // }

  @override
  Widget build(BuildContext context) {

    final rHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: rWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text("Sign Up",
          style: Theme.of(context).textTheme.headline3,
        ),
        leading: IconButton(
          onPressed: () { Navigator.pop(context);},
          icon: const Icon(Icons.arrow_back_ios, 
            size: 20, 
            color: Colors.black,
          ),
        ),
        /*
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              // ThemeService().changeTheme();

              // Provider.of<ThemeProvider>(context, listen: false).swapTheme();
            },
          )
        ],*/
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
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text("Email address",
                      style: Theme.of(context).textTheme.headline2,
                      )
                    ),
                    SizedBox(    
                      height: 43.39,
                      width: double.infinity,
                      // margin: const EdgeInsets.all(20),
                      child: EmailLabel(emailController:registerationController.emailController)
                    ),
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text("First name",
                        style: Theme.of(context).textTheme.headline2,
                      )
                    ),
                    SizedBox(    
                      height: 43.39,
                      width: double.infinity,
                      // margin: const EdgeInsets.all(20),
                      child: NameLabel(
                        nameController: registerationController.nameController,
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text("Last name",
                        style: Theme.of(context).textTheme.headline2,),
                    ),
                    SizedBox(
                      height: 43.39,
                      width: double.infinity,
                      child: LastNameLabel(
                        lastnameController: registerationController.lastnameController,
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text("Phone",
                        style: Theme.of(context).textTheme.headline2,),
                    ),
                    SizedBox(
                      height: 43.39,
                      width: double.infinity,                 
                      child: PhoneLabel(
                          phoneController: registerationController.phoneController),
                    ),
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text("Password",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.headline2,),
                    ),
                    SizedBox(
                      height: 43.39,
                      width: double.infinity,
                      child: PassLabel(
                          passController: registerationController.passController),
                    ),
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text("Age",
                        style: Theme.of(context).textTheme.headline2,),
                    ),
                    SizedBox(
                      height: 43.39,
                      width: double.infinity,
                      key: _form,
                      // margin: const EdgeInsets.all(20),
                      child: AgeLabel(
                          ageController: registerationController.ageController),
                    ),
                    SizedBox(height: rHeight > 700? 70 :20 ),
                    SizedBox(
                      height: 44,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          registerationController.registeration();
                          // _form.currentState!.validate();
                        },
                        child: Text("Sign up ",
                          style: Theme.of(context).textTheme.headline6 
                        ),
                      )
                    ),

                  ],
                )),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? ",
                      style: TextStyle(
                      fontSize: 14,
                      color: rhint1Color), 
                    ),
                    Builder(builder: (cont) {
                      return TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Signin(),),
                          );},
                        child: const Text("Sign in ",
                          style: TextStyle(fontSize: 14, color: rHintP2Color))
                    );
                    }),
                  ],
                ),
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
