import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/colors.dart';

class rlisto extends StatelessWidget {

  String rtitle;
  IconData ricon;
  final Function () rfun;

  rlisto(this.rtitle,this.ricon,this.rfun);



  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      minLeadingWidth: 0,
      shape: Border(
        bottom: BorderSide(
          color: Colors.grey.withOpacity(0.1),
          width: 2
        ),
    ),
      
      leading: Icon(ricon,
      color: rBasicColor,),
      trailing:Icon(Icons.arrow_forward_ios,
      size: 17, color: Colors.grey.withOpacity(0.5),) ,
      onTap: rfun,
      title: Text(rtitle),
    );
  }
}