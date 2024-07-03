import 'package:flutter/material.dart';
// import 'package:flutter_application_2/oldOnes/Admin.dart';
// import 'package:flutter_application_2/oldOnes/Admin2.dart';
// import 'package:flutter_application_2/Auth/controllers/Pass/EditPass_controller.dart';
import '../controllers/Pass/EditPass_controller.dart';
import 'package:flutter_application_2/Auth/controllers/accessPoint/login_controller.dart';
// import 'package:flutter_application_2/oldOnes/EmailLabel.dart';
// import 'package:flutter_application_2/oldOnes/Home.dart';
// import 'package:flutter_application_2/oldOnes/PassLabel.dart';
// import 'package:flutter_application_2/oldOnes//reset.dart';
// import 'package:flutter_application_2/oldOnes/theme.dart';
import 'package:flutter_application_2/Themes/theme_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:flutter_application_2/viewmodel/signin_vm.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login family/labels/PassLabel.dart';
import 'login family/labels/newpassLabel.dart';
import 'login family/reset pass/Reset.dart';
import 'login family/sign up/SignupScreen.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class newpass extends StatefulWidget {
  @override
  _newpass createState() => _newpass();
}

class _newpass extends State<newpass> {
  // late TextEditingController emailController;
  // late TextEditingController passController;
  // LoginViewModel _viewModel = Get.put(LoginViewModel());
  bool val = true;
  final GlobalKey<FormState> formKey = GlobalKey();

  late List data;

  // var data = SigninVM();
  EditPassController editController = Get.put(EditPassController());
  final _userdata = GetStorage();
  final _storage = const FlutterSecureStorage();

  // Future<void> _readFromStorage() async {
  //   LoginController.emailController.text =
  //       await _userdata.read("KEY_USERNAME") ?? '';
  //   LoginController.passController.text =
  //       await _userdata.read("KEY_PASSWORD") ?? '';
  // }

  // _onFormSubmit() async {
  //   if (true) {
  //     // Write values
  //     await _userdata.write(
  //         "KEY_USERNAME", LoginController.emailController.text);
  //     await _userdata.write(
  //         "KEY_PASSWORD", LoginController.passController.text);
  //   }
  // }

  @override
  // void initState() {
  //   // emailController = TextEditingController();
  //   // passController = TextEditingController();

  //   super.initState();
  // }
  void initState() {
    // TODO: implement initState
    super.initState();
    // loginController.check_if_already_login();
    // loginController.login();

  }

  @override
  // void dispose() {
  //   super.dispose();
  //   LoginController.emailController.dispose();
  //   LoginController.passController.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Sign in",
          style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20),
        ),
        leading: Icon(Icons.arrow_back_ios),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              ThemeService().changeTheme();

              // Provider.of<ThemeProvider>(context, listen: false).swapTheme();
            },
          )
        ],
      ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
      //   child: _formType == FormType.login ? loginForm() : null,
      // ),
      body: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(top: 100),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "Password",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Container(
                  height: 43.39,
                  width: 335,
                  // ignore: unnecessary_const
                  child: PassLabel(
                      passController: LoginController.passController)),

              const SizedBox(
                height: 30,
              ),

              ///
              const Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "new Password",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Container(
                  height: 43.39,
                  width: 335,
                  // ignore: unnecessary_const
                  child: newPassLabel(
                      newpassController: editController.newpassController)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Builder(builder: (cont) {
                    return TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Reset(),
                            ),
                          );
                        },
                        child: const Text("forgot password? ",
                            style: TextStyle(color: Colors.grey,fontSize: 14) ));
                  }),
                ],
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                //Center Row contents vertically,
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,

                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: MaterialButton(
                        child: Image(image: AssetImage('hi/gmail.png')),
                        // shape: StadiumBorder(),
                        // color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),

                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: MaterialButton(
                        child: Image(image: AssetImage('hi/facebook.png')),
                        // shape: StadiumBorder(),
                        // color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),

              Center(
                child: SizedBox(
                  height: 44,
                  width: 335,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: const BeveledRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(4)))),
                    onPressed: () {
                      editController.editPass();

                      String username = LoginController.emailController.text;
                      String password = LoginController.passController.text;
                      // if (username != '' && password != '') {
                      // print('Successfull');

                      // loginController.logindata.setBool('login', false);

                      // loginController.logindata.setBool('login', false);
                      // loginController.logindata
                      //     .setString('username', username);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Home()));
                      // }
                      // _onFormSubmit;

                      // SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      //         WidgetsFlutterBinding.ensureInitialized();
                      // String username = loginController.emailController.text;
                      // _userdata.write('isLogged', true);
                      // _userdata.write('username', username);
                      // SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      // var status = prefs.getBool('isLoggedIn') ?? false;

                      // print(loginController.emailController);
                      // print(loginController.passController);
                    }

                    ,

                    child: const Text(
                      // data.title,
                      " reset   ",

                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ), //child widget inside this button
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  ),
                  Builder(builder: (cont) {
                    return TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SignupScreen(),
                            ),
                          );
                        },
                        child: Text("Sign up ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 87, 129, 158)
                                    .withOpacity(.7))));
                  }),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Builder(builder: (cont) {
              //       return TextButton(
              //           onPressed: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (BuildContext context) => Admin(),
              //               ),
              //             );
              //           },
              //           child: const Text("You Are Admin ? ",
              //               style: TextStyle(color: Colors.grey)));
              //     }),
              //   ],
              // ),
            ]),
          )),
    );
  }
}




