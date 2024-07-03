import 'package:flutter/material.dart';
import 'package:flutter_application_2/FetchUserData/controllers/account/fetchUserInfo.dart';
import 'package:flutter_application_2/FetchUserData/controllers/fetchcontrools.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:get/get.dart';

class EditingAgeLabel extends StatefulWidget {
  final TextEditingController EditingageController;
  // final bool fadePassword;
  var AgeTxt;
   EditingAgeLabel({
    super.key,
    required this.EditingageController,
    required this.AgeTxt,
    // required this.fadePassword,
  });

  @override
  State<EditingAgeLabel> createState() => _EditingAgeLabelState();
}

class _EditingAgeLabelState extends State<EditingAgeLabel> {
  late TextEditingController EditingageController;
  FetchUserDataController _fetchUserDataController =
      Get.put(FetchUserDataController());

  @override
  void initState() {
    EditingageController = widget.EditingageController;
    EditingageController.text  = widget.AgeTxt ;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchUserDataController.fetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TextFormField(
            decoration: InputDecoration(
              hintText: snapshot.data!.response!.age.toString(),
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: rbordColor, width: 1.5)),
            ),
            //   enabledBorder: OutlineInputBorder(
            //       borderSide: const BorderSide(
            //         color: Color.fromARGB(255, 69, 68, 67),
            //         width: 1,
            //       ),
            //       borderRadius: BorderRadius.circular(10)),
            // ),
            autocorrect: true,
            textAlign: TextAlign.left,

            keyboardType: TextInputType.number,
            controller: EditingageController,
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
