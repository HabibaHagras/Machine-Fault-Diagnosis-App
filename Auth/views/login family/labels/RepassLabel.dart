import 'package:flutter/material.dart';
// import 'package:flutter_try_1/src/features/authentication/controllers/cont.dart';
import 'package:flutter_application_2/Auth/views/login%20family/labels/PassLabel.dart';
import 'package:flutter_application_2/Auth/controllers/accessPoint/registeration_controller.dart';

import '../../../../../../constants/colors.dart';



class RepassLabel extends StatefulWidget {
  final TextEditingController repassController;
  // final bool fadePassword;

  const RepassLabel({
    super.key,
    required this.repassController
    // , required repassController,
    // required this.fadePassword,
  });

  @override
  State<RepassLabel> createState() => _RepassLabelState();
}

class _RepassLabelState extends State<RepassLabel> {
  late TextEditingController repassController;

  bool passvisable = true;

  @override
  void initState() {
    repassController = widget.repassController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val){
        if(val!.isEmpty)
          return 'Empty';
        if(val != RegisterationController().passController.text)
          return 'Not Match';
        return null;
      },
      controller: repassController,

      decoration: InputDecoration(
        hintText: "Enter Password",
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: rbordColor, width: 1.5),
          ),
        suffixIcon: IconButton(
          icon: Icon(
            passvisable ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: (() {
            setState(() {
              passvisable = !passvisable;
            });
          }),
        ),
      ),
      // maxLines: 3,
      autocorrect: true,
      keyboardType: TextInputType.visiblePassword,
      obscureText: passvisable,

    );
  }
}
