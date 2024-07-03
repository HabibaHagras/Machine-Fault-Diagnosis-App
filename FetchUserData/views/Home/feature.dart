import 'package:flutter/material.dart';

class rFeatureBox extends StatelessWidget {
  List list;
  int num;
  rFeatureBox({
    Key? key,
    required this.list,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 7,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*-------------------------------العنوان------------------------ */
          Text(list[num]['name'],
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 3,),

          /*------------------------------------المحتوي---------------------------- */
          Text(list[num]['sectionText'],
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 10,
            
          )),
          Container(
            margin: EdgeInsets.only(top: 7),
            width: double.infinity,
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                /*-----------------------------الصورة---------------------------------------- */
                  fit: BoxFit.cover, image: NetworkImage(list[num]['imageUrl'])),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              
            ),
          ),
        ],
      ),
    );
  }
}