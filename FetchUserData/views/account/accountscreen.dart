import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/controllers/accessPoint/logout_controller.dart';
import 'package:flutter_application_2/Auth/views/EditAccDetails/My_Details.dart';
import 'package:flutter_application_2/FetchUserData/controllers/account/fetchUserInfo.dart';
import 'package:flutter_application_2/FetchUserData/controllers/fetchcontrools.dart';
import 'package:flutter_application_2/Auth/controllers/accessPoint/login_controller.dart';
import 'package:flutter_application_2/FetchUserData/views/account/myBoxStyle.dart';
import 'package:flutter_application_2/FetchUserData/views/account/mylist.dart';
import 'package:flutter_application_2/FetchUserData/views/account/resultPage.dart';

import 'package:flutter_application_2/Auth/views/logout/loged.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:flutter_application_2/constants/images_strings.dart';
import 'package:flutter_application_2/constants/text_strings.dart';

import 'package:flutter_application_2/Auth/views/login%20family/reset%20pass/AlmostDone.dart';
import 'package:flutter_application_2/Auth/views/editpassScreen/editPassword.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class rAccount extends StatefulWidget {
  const rAccount({super.key});

  @override
  State<rAccount> createState() => _rAccountState();
}

class _rAccountState extends State<rAccount> {
  LoginController loginController = Get.put(LoginController());
  LogoutController logoutController = Get.put(LogoutController());
  FetchDataController fetchController = Get.put(FetchDataController());
  FetchUserDataController _fetchUserDataController =
      Get.put(FetchUserDataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    loginController.logindata = await SharedPreferences.getInstance();
    setState(() {
      // username = loginController.logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final rHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: size.height,
        child: FutureBuilder(
            future: _fetchUserDataController.fetchUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(children: [
                  Stack(
                    children: [
                      Positioned(
                          child: SizedBox(
                        width: double.infinity,
                        height: size.height * 0.3,
                        child: Image(
                          image: AssetImage(rCoverAcc),
                          fit: BoxFit.cover,
                          color: Colors.black.withOpacity(0.5),
                          colorBlendMode: BlendMode.darken,
                        ),
                      )),
                      Positioned(
                        top: size.height * 0.09,
                        left: 20,
                        child: CircleAvatar(
                          radius: rHeight > 700
                              ? size.height * .07
                              : rHeight * 0.08,
                          // backgroundImage: AssetImage(rProfileAcc)
                          backgroundImage: NetworkImage(
                              snapshot.data!.response!.imageUrl.toString())
                          // MemoryImage(
                          //     base64Decode(snapshot.data!.response!.userImage.toString()))
                          ,
                        ),
                      ),
                      Positioned(
                          left: 20,
                          top: size.height * .25,
                          child: Text(
                            snapshot.data!.response!.fristName.toString(),
                            style: Theme.of(context).textTheme.headline6,
                          ))
                    ],
                  ),
                  Positioned(
                      height: 200,
                      top: size.height * .29,
                      left: rHeight > 700 ? 20 : 12,
                      child: rBoxAcc([
                        rlisto("My Details", Icons.my_library_books, () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: newinfo(),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        }),
                        rlisto("Change Password", Icons.fingerprint_outlined,
                            () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: changePass(),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        }),
                        rlisto("Last Results", Icons.reviews_outlined, () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: ResultScreen(),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        }),
                      ])),
                  Positioned(
                    height: 70,
                    top: rHeight > 700 ? rHeight * .57 : rHeight * .7,
                    left: rHeight > 700 ? 20 : 12,
                    child: rBoxAcc([
                      rlisto(
                        "Sign Out",
                        Icons.logout_rounded,
                        () async {
                          loginController.logindata.setBool('login', true);
                          logoutController.logout();

                          Get.to(Loged());
                        },
                      )
                    ]),
                  ),
                ]);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const SizedBox(
                child: const CircularProgressIndicator(),
                height: 0.0,
                width: 0.0,
              );
            }),
      ),
    );
  }
}
