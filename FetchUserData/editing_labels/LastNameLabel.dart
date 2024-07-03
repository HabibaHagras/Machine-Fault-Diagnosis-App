import 'package:flutter/material.dart';
import 'package:flutter_application_2/FetchUserData/controllers/account/fetchUserInfo.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';

class EditingLastNameLabel extends StatefulWidget {
  final TextEditingController EditinglastnameController;
  var LastnameTxt;
  // final bool fadePassword;

  EditingLastNameLabel({
    super.key,
    required this.EditinglastnameController,
    required this.LastnameTxt,
    // required this.fadePassword,
  });

  @override
  State<EditingLastNameLabel> createState() => _EditingLastNameLabelState();
}

class _EditingLastNameLabelState extends State<EditingLastNameLabel> {
  late TextEditingController EditinglastnameController;
  FetchUserDataController _fetchUserDataController =
      Get.put(FetchUserDataController());

  @override
  void initState() {
    EditinglastnameController = widget.EditinglastnameController;
    EditinglastnameController.text= widget.LastnameTxt;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchUserDataController.fetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TextFormField(
            validator: (value) => value!.isEmpty ? 'email is null ' : null,
            decoration: InputDecoration(
              hintText: snapshot.data!.response!.lastName.toString(),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: rbordColor, width: 1.5),
              ),
            ),
            controller: EditinglastnameController,
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
