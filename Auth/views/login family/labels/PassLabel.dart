import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';


class PassLabel extends StatefulWidget {
  final TextEditingController passController;
  // final bool fadePassword;

  const PassLabel({
    super.key,
    required this.passController,
    // required this.fadePassword,
  });

  @override
  State<PassLabel> createState() => _PassLabelState();
}

class _PassLabelState extends State<PassLabel> {
  late TextEditingController passController;
  bool passvisable = true;

  @override
  void initState() {
    passController = widget.passController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passController,
      decoration: InputDecoration(
        hintText: "Enter Password",
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        suffixIcon: IconButton(
          icon: Icon(
            passvisable ? Icons.visibility : Icons.visibility_off,),
            onPressed: (() {
              setState(() {passvisable = !passvisable;});
            }),
        ),
        focusedBorder:const OutlineInputBorder(
          borderSide: BorderSide(color: rbordColor, width: 1.5)
        ),
        
        ),
      autocorrect: true,
      keyboardType: TextInputType.visiblePassword,
      obscureText: passvisable,
    );
  }
}
