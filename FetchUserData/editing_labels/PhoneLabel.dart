import 'package:flutter/material.dart';
import 'package:flutter_application_2/FetchUserData/controllers/account/fetchUserInfo.dart';
import 'package:flutter_application_2/FetchUserData/controllers/fetchcontrools.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';

class EditingPhoneLabel extends StatefulWidget {
  final TextEditingController EditingphoneController;
  var PhoneTxt;
  // final bool fadePassword;

  EditingPhoneLabel({
    super.key,
    required this.EditingphoneController,
    required this.PhoneTxt,
    // required this.fadePassword,
  });

  @override
  State<EditingPhoneLabel> createState() => _EditingPhoneLabelState();
}

class _EditingPhoneLabelState extends State<EditingPhoneLabel> {
  late TextEditingController EditingphoneController;
  FetchUserDataController _fetchUserDataController =
      Get.put(FetchUserDataController());

  @override
  void initState() {
    EditingphoneController = widget.EditingphoneController;
    EditingphoneController.text= widget.PhoneTxt;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchUserDataController.fetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TextField(
            decoration: InputDecoration(
              hintText: snapshot.data!.response!.phone.toString(),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: rbordColor, width: 1.5),
              ),
            ),
            autocorrect: true,
            keyboardType: TextInputType.phone,
            controller: EditingphoneController,
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return Center(
          child: const CircularProgressIndicator(
            color: rBasicColor,
            strokeWidth: 2,
          ),
        );
        ;
      },
    );
  }
}
