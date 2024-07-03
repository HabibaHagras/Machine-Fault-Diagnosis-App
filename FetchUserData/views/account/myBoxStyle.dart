import 'package:flutter/material.dart';

class rBoxAcc extends StatelessWidget {
  
  List<Widget> rdg;

  rBoxAcc(this.rdg);

  @override
  Widget build(BuildContext context) {
    final rHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal:15, vertical: 5),
      width: rHeight > 700? 355 : 335,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        // border: Border.all(width: 1),
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      
      child:Material(
        color: Colors.transparent,
        child: ListView(
            padding: EdgeInsets.all(0),
            
            children: rdg,

            
          
      ),
       )
    );
  }
}