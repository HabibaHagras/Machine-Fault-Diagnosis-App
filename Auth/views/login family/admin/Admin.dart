
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/views/login%20family/sign%20in/Sign_in.dart';
import 'package:flutter_application_2/Auth/views/login%20family/reset%20pass/Reset.dart';
import 'package:flutter_application_2/Auth/views/login family/labels/passLabel.dart';

import 'package:flutter_application_2/constants/colors.dart';


class Admin extends StatefulWidget {
  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  late TextEditingController passController;

  @override
  void initState() {
    passController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final rHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Admin-only area",
        style: Theme.of(context).textTheme.headline3,),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, 
            size: 20, 
            color: Colors.black
          ),
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(
                builder: (BuildContext context) => Signin(),),
            );
          },
        ),
      ),
      body: Center(
        child: Container(
          padding: new EdgeInsets.all(20.0),
          child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20),
                children: [
                  Center(child: Icon(Icons.security, size: 100),),
                  // Text("Reset Password"),
                  Container(
                    padding: EdgeInsets.symmetric(vertical:40),
                    child: const Text(
                      '''you need to provide a password to \n be able to access this page''',
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: rHeight>700? 40:0 ,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Password",
                    style: Theme.of(context).textTheme.headline2
                  )),
                  SizedBox(
                    height: 43.39,
                    width: double.infinity, // ignore: unnecessary_const
                      child: PassLabel(passController: passController)
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child:
                      Builder(builder: (cont) {
                        return TextButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(
                              builder: (BuildContext context) => Reset(),),
                            );
                          },
                          child: const Text("forgot password? ",
                            style: TextStyle(color: rhint1Color,fontSize: 14) )
                        );
                      }),
                  ),
                  SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Log in ",
                          style: Theme.of(context).textTheme.headline6,
                        ), //child widget inside this button
                      ),
                    ),
                 
                ],
              ),
        ),
      ),
    );

    // TODO: implement build
    throw UnimplementedError();
  }
}
