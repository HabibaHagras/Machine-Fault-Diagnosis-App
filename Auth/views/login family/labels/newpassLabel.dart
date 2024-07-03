import 'package:flutter/material.dart';

class newPassLabel extends StatefulWidget {
  final TextEditingController newpassController;
  // final bool fadePassword;

  const newPassLabel({
    super.key,
    required this.newpassController,
    // required this.fadePassword,
  });

  @override
  State<newPassLabel> createState() => _newPassLabelState();
}

class _newPassLabelState extends State<newPassLabel> {
  late TextEditingController newpassController;
  bool passvisable = true;

  @override
  void initState() {
    newpassController = widget.newpassController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newpassController,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          // color: Colors.white,
            fontSize: 20,
            fontStyle: FontStyle.italic),
        hintText: "Password",
        suffixIcon: IconButton(
          icon: Icon(
            passvisable ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: (() {
            setState(() {
              passvisable = !passvisable;
            });
          }),
        ),focusedBorder:const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.lightBlue
          )
      ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 69, 68, 67),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      textAlign: TextAlign.left,
      // maxLines: 3,
      autocorrect: true,
      keyboardType: TextInputType.visiblePassword,
      obscureText: passvisable,
    );
  }
}
