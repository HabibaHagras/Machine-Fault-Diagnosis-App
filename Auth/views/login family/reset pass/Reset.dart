import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/views/login%20family/reset%20pass/AlmostDone.dart';
// import 'package:flutter_proj_1/AlmostDone2.dart';
import 'package:flutter_application_2/Auth/views/login%20family/sign%20in/Sign_in.dart';
import 'package:flutter_application_2/Auth/views/login%20family/sign%20up/SignupScreen.dart';
import 'package:flutter_application_2/Auth/views/login%20family/labels/EmailLabel.dart';
import 'package:flutter_application_2/constants/colors.dart';



class Reset extends StatefulWidget {
  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final rHeiget = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: rWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Reset Password",
          style: Theme.of(context).textTheme.headline3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, 
            size: 20, 
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Signin(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: new EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: rHeiget > 700? 140 :30,
                    bottom: 70),
                  child: Text("Enter your email address and  we'll send \nyou an email with instructions to reset \nyour password",
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Email address",
                style: Theme.of(context).textTheme.headline2
              )),
              SizedBox(
                  height: 43.39,
                  width: double.infinity,
                  child: EmailLabel(emailController: emailController)),
              const SizedBox(height: 50,),

              SizedBox(
                height: 44,
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Reset Password",
                    style: Theme.of(context).textTheme.headline6,
                  ), //child widget inside this button
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => AlmostDone(),),
                    ); //task to execute when this button is pressed
                  },
                ),
              ),
              const SizedBox(height: 5,),
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
                          Navigator.push(context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SignupScreen(),),
                          );
                        },
                        child: const Text("Sign up ",
                            style: TextStyle(fontSize: 14, color: rHintP2Color)
                        )
                    );
                  }),
                ],
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
