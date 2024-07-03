import 'package:flutter/material.dart';
import 'package:flutter_application_2/FetchUserData/controllers/account/fetchUserInfo.dart';
import 'package:flutter_application_2/FetchUserData/controllers/fetchcontrools.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';

class EditingNameLabel extends StatefulWidget {
  final TextEditingController EditingnameController;
  var NameTxt;
  // final bool fadePassword;

   EditingNameLabel({
    super.key,
    required this.EditingnameController,
    required this.NameTxt,

    // required this.fadePassword,
  });

  @override
  State<EditingNameLabel> createState() => _EditingNameLabelState();
}

class _EditingNameLabelState extends State<EditingNameLabel> {
  late TextEditingController EditingnameController;
  FetchUserDataController _fetchUserDataController =
      Get.put(FetchUserDataController());

  @override
  void initState() {
    EditingnameController = widget.EditingnameController;
    EditingnameController.text = widget.NameTxt;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchUserDataController.fetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String name = snapshot.data!.response!.fristName.toString();

          return TextFormField(
            onChanged: (String value) {
              /// The value is the value of the TextField.
              /// You can perform the calculations here:
              setState(() => snapshot.data!.response!.fristName = value);
            },
            validator: (value) => value!.isEmpty ? 'email is null ' : null,
            decoration: InputDecoration(
              // hintText: snapshot.data!.response!.fristName.toString(),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: rbordColor, width: 1.5),
              ),
            ),
            controller: EditingnameController,
            autocorrect: true,
            keyboardType: TextInputType.text,
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
  }
}
