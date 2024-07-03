import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';


class PhoneLabel extends StatefulWidget {
  final TextEditingController phoneController;
  // final bool fadePassword;

  const PhoneLabel({
    super.key,
    required this.phoneController,
    // required this.fadePassword,
  });

  @override
  State<PhoneLabel> createState() => _PhoneLabelState();
}

class _PhoneLabelState extends State<PhoneLabel> {
  late TextEditingController phoneController;
  @override
  void initState() {
    phoneController = widget.phoneController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Enter Phone Number",
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 5),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: rbordColor, width: 1.5),
          ),
        
      ),
      autocorrect: true,
      keyboardType: TextInputType.phone,
      controller: phoneController,
    );
  }
}
