import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';


class NameLabel extends StatefulWidget {
  final TextEditingController nameController;
  // final bool fadePassword;

  const NameLabel({
    super.key,
    required this.nameController,
    // required this.fadePassword,
  });

  @override
  State<NameLabel> createState() => _NameLabelState();
}

class _NameLabelState extends State<NameLabel> {
  late TextEditingController nameController;
  @override
  void initState() {
    nameController = widget.nameController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(


      validator: (value) => value!.isEmpty ? 'email is null ':null ,
      
      decoration: const InputDecoration(
        hintText: "Enter first name",
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 5),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: rbordColor, width: 1.5),
          ),
      ),

      controller: nameController,
      autocorrect: true,
      keyboardType: TextInputType.text,

    );
  }
}
