import 'package:flutter/material.dart';
import 'package:flutter_application_2/FetchUserData/controllers/account/fetchUserInfo.dart';
import 'package:flutter_application_2/FetchUserData/controllers/fetchcontrools.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:get/get.dart';

import '../controllers/Result/ResultController.dart';

class EditingFeedbackLabel extends StatelessWidget {
  final TextEditingController EditingFeedbackController;
  // final bool fadePassword;
  var indexofresponce;

  EditingFeedbackLabel({
    super.key,
    required this.EditingFeedbackController,
    required this.indexofresponce,
    // required this.fadePassword,
  });

  @override
//   State<EditingRateLabel> createState() => _EditingRateLabelState();
// }

// class _EditingRateLabelState extends State<EditingRateLabel> {

  // late TextEditingController EditingRateController;
  ResultController _resultController = Get.put(ResultController());

  @override
  // void initState() {
  //   EditingRateController = widget.EditingRateController;

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _resultController.getResult(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TextFormField(
            decoration: InputDecoration(
              hintText:
                  snapshot.data!.response![indexofresponce].feedback.toString(),
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: rbordColor, width: 1.5)),
            ),
            autocorrect: true,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.text,
            controller: EditingFeedbackController,
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
