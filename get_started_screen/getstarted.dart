
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/views/login%20family/sign%20in/Sign_in.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:flutter_application_2/constants/images_strings.dart';
import 'package:flutter_application_2/constants/sizes.dart';
import 'package:flutter_application_2/constants/text_strings.dart';
import 'package:flutter_application_2/get_started_screen/getbox.dart';
import 'package:flutter_application_2/Auth/views/login/login.dart';
import 'package:get/get.dart';

class getStart extends StatelessWidget {
  const getStart({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;


    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        padding: EdgeInsets.all(Rd),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(rGetStartedImage),
          opacity: Rop,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.difference,),
          fit: BoxFit.cover),),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top:size.height*0.4,
              child: getbox(size: size),
            ),
            Positioned(
              bottom: size.height * 0.06,
              width: 295,
              child: ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: (){
                  Get.to(() => Signin());
                },
                child: Text("Get Started!",
                style:Theme.of(context).textTheme.headline6 ,),
              ),
            )
          ],
        ),
      )
    );
  }
}

