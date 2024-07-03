import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class getbox extends StatelessWidget {
  const getbox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:rgetoColor ,
        borderRadius: BorderRadius.circular(25)
      ),
      padding: EdgeInsets.all(Rd),
      height: 136,
      width: size.width - (Rd*2),
      child: Text(rBox,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText1,),
    );
  }
}