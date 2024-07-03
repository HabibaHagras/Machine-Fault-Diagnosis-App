import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class rAboutUs extends StatelessWidget {
  const rAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: Column(
              children: [
                Container(
                  width:double.infinity,
                  height: 200,
                  margin: EdgeInsets.only(top:40, bottom: 10, left: 10, right: 10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ), 
                  child: Image(image: AssetImage("assets/logoo.png",)),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),   
                  child: ExpansionTile(
                    expandedAlignment: Alignment.topLeft,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    childrenPadding: EdgeInsets.only(left: 20, bottom: 10),
                    title: Text('E-mail',
                    style: TextStyle(
                      color: RhomeTitleColor,
                      fontFamily: 'Segoe UI',
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),),
                    children: [
                      Text('------@gmail.com'),
                    ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),   
                  child: ExpansionTile(
                    expandedAlignment: Alignment.topLeft,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    childrenPadding: EdgeInsets.only(left: 20, bottom: 10),
                    title: Text('Phone',
                    style: TextStyle(
                      color: RhomeTitleColor,
                      fontFamily: 'Segoe UI',
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),),
                    children: [
                      Text('+2000000000'),
                      
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),  
                  child: ExpansionTile(
                    expandedAlignment: Alignment.topLeft,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      childrenPadding: EdgeInsets.only(left: 20, bottom: 10, right: 20),
                    title:Text('Address',
                        style: TextStyle(
                        color: RhomeTitleColor,
                        fontFamily: 'Segoe UI',
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),),
                    children: [
                      Text('00 St')
                    ],
                  ),
                )
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}