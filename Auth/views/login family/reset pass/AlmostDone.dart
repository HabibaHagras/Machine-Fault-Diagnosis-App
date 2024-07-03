import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/views/login%20family/sign%20in/Sign_in.dart';
// import 'package:flutter_try_1/src/features/authentication/screens/login family/reset pass/Reset.dart';
import 'package:flutter_application_2/constants/colors.dart';


class AlmostDone extends StatefulWidget {
  @override
  State<AlmostDone> createState() => _AlmostDoneState();
}

class _AlmostDoneState extends State<AlmostDone> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Almost Done!",
          style: Theme.of(context).textTheme.headline3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, 
            size: 20, 
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(
                builder: (BuildContext context) => Signin(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 600,
          height: 500,
          padding: new EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListTile(
                subtitle: Center(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text("Last Step",
                            style: TextStyle(fontSize: 18.0,
                            color: Colors.black),
                            ),
                      ),
                      Icon(Icons.done_all,size: 60,color: Colors.black,),
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Text(
                          'Thank You!  \n We Will Send Email To',
                          style: TextStyle(fontSize: 16.0,
                          color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        " Acc@gmail.com ",
                        style: TextStyle(
                          color: rBasicColor,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "click to confirm link in your inbox \n to verify your accout",
                        style: TextStyle(fontSize: 16.0,
                        color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
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
