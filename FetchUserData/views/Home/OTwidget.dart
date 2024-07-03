import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class OTcont extends StatelessWidget {
  const OTcont({
    Key? key,
    required this.A,
  }) : super(key: key);

  final Widget A;

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.only(bottom: 40),
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 7
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: .3 , color: Colors.grey),
                )
              ),
              width: double.infinity,
              child: A
            );
  }
}




class OTCName extends StatelessWidget {
  const OTCName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 20
      ),
      child: Text('Our Team Board',
      style: TextStyle(
        color: RhomeTitleColor,
        fontSize: 16,
        fontFamily: 'Segoe UI',
        fontWeight: FontWeight.bold
      ),
    ),
                );
  }
}

