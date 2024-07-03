import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';


class EditingPassLabel extends StatefulWidget {
  final TextEditingController EditingpassController;
  // final bool fadePassword;

  const EditingPassLabel({
    super.key,
    required this.EditingpassController,
    // required this.fadePassword,
  });

  @override
  State<EditingPassLabel> createState() => _EditingPassLabelState();
}

class _EditingPassLabelState extends State<EditingPassLabel> {
  late TextEditingController EditingpassController;
  bool passvisable = true;

  @override
  void initState() {
    EditingpassController = widget.EditingpassController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: EditingpassController,
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
