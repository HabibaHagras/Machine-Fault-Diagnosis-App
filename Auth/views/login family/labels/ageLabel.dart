import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';


class AgeLabel extends StatefulWidget {
  final TextEditingController ageController;
  // final bool fadePassword;

  const AgeLabel({
    super.key,
    required this.ageController,
    // required this.fadePassword,
  });

  @override
  State<AgeLabel> createState() => _AgeLabelState();
}

class _AgeLabelState extends State<AgeLabel> {
  late TextEditingController ageController;
  @override
  void initState() {
    ageController = widget.ageController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Enter Age Number",
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 5),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: rbordColor, width: 1.5),
          ),
        
      ),
      autocorrect: true,
      keyboardType: TextInputType.number,
      controller: ageController,
    );
  }
}
