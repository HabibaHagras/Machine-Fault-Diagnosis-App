import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class ourTeamCont extends StatelessWidget {
  List list;
  int num;

  ourTeamCont({
    Key? key,
    required this.list,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(

            /*-----------------------صورة التيم---------------------------- */
            backgroundImage: NetworkImage(list[num]['image']),
            radius: 35,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3),

            /*--------------------------اسم الفرد-------------------- */
            child: Text(list[num]['name'],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: RhomeTitleColor,
              fontSize: 11,
              fontFamily: 'Segoe UI',
              fontWeight: FontWeight.bold
          ),),
        ),
        Column(
          children: [
            /*------------------------------وظفيته--------------------- */
            Text(list[num]['job'],
            style: TextStyle(
              fontSize: 10,
              color: rBasicColor
            ),),
            /*-------------------------------------الكلام عنه----------------------- */
            Text(list[num]['sppech'],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8,
              color: rBasicColor
            ),),
            
          ],
        )
      ],
    ),
    );
  }
}






