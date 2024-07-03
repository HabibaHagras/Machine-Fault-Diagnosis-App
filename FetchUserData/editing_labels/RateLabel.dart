import 'package:flutter/material.dart';
import 'package:flutter_application_2/FetchUserData/controllers/account/fetchUserInfo.dart';
import 'package:flutter_application_2/FetchUserData/controllers/fetchcontrools.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:get/get.dart';

import '../controllers/Result/ResultController.dart';

class EditingRateLabel extends StatelessWidget {
  final TextEditingController EditingRateController;
  // final bool fadePassword;
  int indexofresponce;

  EditingRateLabel({
    super.key,
    required this.EditingRateController,
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
                  snapshot.data!.response![indexofresponce].rate.toString(),
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: rbordColor, width: 1.5)),
            ),
            autocorrect: true,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.number,
            controller: EditingRateController,
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
