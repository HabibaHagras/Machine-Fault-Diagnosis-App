import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';


class LastNameLabel extends StatefulWidget {
  final TextEditingController lastnameController;
  // final bool fadePassword;

  const LastNameLabel({
    super.key,
    required this.lastnameController,
    // required this.fadePassword,
  });

  @override
  State<LastNameLabel> createState() => _LastNameLabelState();
}

class _LastNameLabelState extends State<LastNameLabel> {
  late TextEditingController lastnameController;
  @override
  void initState() {
    lastnameController = widget.lastnameController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return TextFormField(


      validator: (value) => value!.isEmpty ? 'email is null ':null ,

      decoration: const InputDecoration(
        hintText: "Enter last name",
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 5),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: rbordColor, width: 1.5),
        ),
      ),

      controller: lastnameController,
      autocorrect: true,
      keyboardType: TextInputType.text,

    );
  }
}
