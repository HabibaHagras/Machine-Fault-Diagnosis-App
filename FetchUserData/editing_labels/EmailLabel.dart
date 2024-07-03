// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_application_2/FetchUserData/controllers/account/fetchUserInfo.dart';
import 'package:flutter_application_2/FetchUserData/controllers/fetchcontrools.dart';
import 'package:flutter_application_2/constants/colors.dart';

class EditingEmailLabel extends StatefulWidget {
  final TextEditingController EditemailController;
  var EmailText;
  // final bool fadePassword;

   EditingEmailLabel({
    Key? key,
    required this.EditemailController,
    required this.EmailText,
  }) : super(key: key);

  @override
  State<EditingEmailLabel> createState() => _EditingEmailLabelState();
}

class _EditingEmailLabelState extends State<EditingEmailLabel> {
  late TextEditingController EditingEmailLabel;
  FetchUserDataController _fetchUserDataController =
      Get.put(FetchUserDataController());
  String h = "habi a";

  @override
  void initState() {
    EditingEmailLabel = widget.EditemailController;
    EditingEmailLabel.text =widget. EmailText;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchUserDataController.fetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              hintText: snapshot.data!.response!.email.toString(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: rbordColor, width: 1.5),
              ),
            ),
            autocorrect: true,
            keyboardType: TextInputType.emailAddress,
            controller: EditingEmailLabel,
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const Center(
          child: const CircularProgressIndicator(
            color: rBasicColor,
            strokeWidth: 2,
          ),
        );
        ;
      },
    );
    //   TextFormField(
    //   decoration: const InputDecoration(
    //       border: OutlineInputBorder(),
    //       contentPadding: EdgeInsets.symmetric(horizontal: 5),
    //       hintText: "Enter email address",
    //       focusedBorder: OutlineInputBorder(
    //         borderSide: BorderSide(color: rbordColor, width: 1.5),
    //       ),
    //   ),
    //   autocorrect: true,
    //   keyboardType: TextInputType.emailAddress,
    //   controller: emailController,
    // );
  }
}
