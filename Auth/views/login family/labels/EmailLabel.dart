import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/colors.dart';

class EmailLabel extends StatefulWidget {
  final TextEditingController emailController;
  // final bool fadePassword;

  const EmailLabel({
    super.key,
    required this.emailController,
    // required this.fadePassword,
  });

  @override
  State<EmailLabel> createState() => _EmailLabelState();
}

class _EmailLabelState extends State<EmailLabel> {
  late TextEditingController emailController;
  @override
  void initState() {
    emailController = widget.emailController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration( 
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 5),
          hintText: "Enter email address",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: rbordColor, width: 1.5),
          ),
      ),
      autocorrect: true,
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
    );
  }
}
