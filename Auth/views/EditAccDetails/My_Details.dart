import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_2/oldOnes/Admin.dart';
// import 'package:flutter_application_2/oldOnes/Admin2.dart';
// import 'package:flutter_application_2/oldOnes/AgeLabel.dart';
import 'package:flutter_application_2/Auth/controllers/User/EditUser_Controller.dart';
import 'package:flutter_application_2/Auth/controllers/accessPoint/login_controller.dart';
import 'package:flutter_application_2/FetchUserData/editing_labels/AgeLabel.dart';
import 'package:flutter_application_2/FetchUserData/editing_labels/EmailLabel.dart';
import 'package:flutter_application_2/FetchUserData/editing_labels/LastNameLabel.dart';
import 'package:flutter_application_2/FetchUserData/editing_labels/NameLabel.dart';
import 'package:flutter_application_2/FetchUserData/editing_labels/PhoneLabel.dart';
// import 'package:flutter_application_2/oldOnes/EmailLabel.dart';
// import 'package:flutter_application_2/oldOnes/Home.dart';
// import 'package:flutter_application_2/oldOnes/PassLabel.dart';
// import 'package:flutter_application_2/oldOnes/PhoneLabel.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:flutter_application_2/constants/images_strings.dart';
// import 'package:flutter_application_2/oldOnes/reset.dart';
// import 'package:flutter_application_2/oldOnes/theme.dart';
import 'package:flutter_application_2/Themes/theme_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutter_application_2/viewmodel/signin_vm.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../FetchUserData/controllers/account/fetchUserInfo.dart';
import '../login family/labels/RepassLabel.dart';
import '../login family/sign in/Sign_in.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class newinfo extends StatefulWidget {
  @override
  _newinfo createState() => _newinfo();
}

class _newinfo extends State<newinfo> {
  // late TextEditingController emailController;
  // late TextEditingController passController;
  // LoginViewModel _viewModel = Get.put(LoginViewModel());
  bool val = true;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  late List data;

  // var data = SigninVM();
  EditUserController editUser = Get.put(EditUserController());
  final _userdata = GetStorage();
  final _storage = const FlutterSecureStorage();


  FetchUserDataController _fetchUserDataController = Get.put(FetchUserDataController());

  @override

  void initState() {
    // TODO: implement initState

  // Step 2 <- SEE HERE
  // EditingEmailLabel.va = 'Complete the story from here...';

    super.initState();
    // loginController.check_if_already_login();
    // loginController.login();

  }
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: Text('Please choose media to select',style: TextStyle(color: rBasicColor),),
              content: Container(
              padding: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height / 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          editUser.getImage(ImageSource.gallery);
                        },
                        child: Icon( //<-- SEE HERE
                          CupertinoIcons.cloud_upload,
                          color: Colors.white,
                          size: 30,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), //<-- SEE HERE
                          padding: EdgeInsets.all(10),
                          elevation: 4,
                          shadowColor: rBasicColor
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('Gallery',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16
                      ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          editUser.getImage(ImageSource.camera);
                        },
                        child: Icon( //<-- SEE HERE
                          CupertinoIcons.camera,
                          color: Colors.white,
                          size: 30,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), //<-- SEE HERE
                          padding: EdgeInsets.all(10),
                          elevation: 4,
                          shadowColor: rBasicColor
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('Camera',
                      style: TextStyle(
                        fontSize: 16,
                      ),)
                    ],
                  ),
              
                ],
              ),
            ),
            );
        });
  }


  @override

  @override
  Widget build(BuildContext context) {

    final rHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: rWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text("  My Details",
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
              Form(child: 
              FutureBuilder(
      future:_fetchUserDataController.fetchUserData()
    ,
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    return 
              
              Column(
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
                      child: EditingEmailLabel(EditemailController:editUser.EditemailController, EmailText: snapshot.data!.response!.email,)
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
                    child: EditingNameLabel(
                      EditingnameController: editUser.EditingnameController, NameTxt: snapshot.data!.response!.fristName
,
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
                    child: EditingLastNameLabel(
                      EditinglastnameController: editUser.EditinglastnameController, LastnameTxt: snapshot.data!.response!.lastName,
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
                    child: EditingPhoneLabel(
                        EditingphoneController: editUser.EditingphoneController, PhoneTxt: snapshot.data!.response!.phone,),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text("age",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline2,),
                  ),
                  SizedBox(
                    height: 43.39,
                    width: double.infinity,
                    child: EditingAgeLabel(
                        EditingageController: editUser.EditingageController, AgeTxt: snapshot.data!.response!.age.toString()),
                  ),

                  const SizedBox(height: 15,),

                  ElevatedButton(
                    onPressed: () {
                      myAlert();
                    },
                    child: Text('Upload Photo'),
                  ),
                  SizedBox(height: rHeight > 700? 70 :20 ),
                  SizedBox(
                      height: 44,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          editUser.editUser();
                        },
                        child: Text("Save changes ",
                            style: Theme.of(context).textTheme.headline6
                        ),
                      )
                  ),

                ],
              );}

    // By default, show a loading spinner.
    return const SizedBox(child: const CircularProgressIndicator(), height: 1.0,
      width: 1.0,);;
    },
    )
              
              
              )
              ,




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

