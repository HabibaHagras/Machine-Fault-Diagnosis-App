
import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';
import 'package:flutter_application_2/Auth/controllers/accessPoint/login_controller.dart';
import '../labels/EmailLabel.dart';
import '../labels/PassLabel.dart';
import '../reset pass/Reset.dart';

class signinform extends StatelessWidget {
  const signinform({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    final  h =MediaQuery.of(context).size.height;
    return Form(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child:  Text( "Email address or Phone",
          style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(
          height: 43.39,
          width: double.infinity,                   
          child: EmailLabel(
            emailController: LoginController.emailController),
        ),
        SizedBox(height: h>700?30:20,),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text("Password",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(
          height: 43.39,
          width: double.infinity,
          child: PassLabel(
            passController: LoginController.passController)
        ),
        Container(
          height: h>700?50:30,
        ),
        SizedBox(
          height: 44,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              loginController.login();
              String username = LoginController.emailController.text;
              String password = LoginController.passController.text;
            },
            child:Text(
              // data.title,
              "Sign in",
              style: Theme.of(context).textTheme.headline6,
            ), //child widget inside this button
          ),
        ),
      ]
    ));
  }
}
