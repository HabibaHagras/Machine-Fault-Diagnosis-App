import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/text_strings.dart';

class rLogin extends StatelessWidget {
  const rLogin({super.key});

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () { Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios, 
            size: 20, 
            color: Colors.black,
          ),
        ),
        title: Text(rSignin, style: Theme.of(context).textTheme.headline3,),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Form(child: Column(
                  children:[
                    inputFile(label: "Email"),
                    inputFile(label: "Password", obscureText: true),
                    const SizedBox(height: 5,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: (){},
                        child: const Text(rForgetPassword)),
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text(rSignin,
                        style: TextStyle(fontSize: 20)),
                        ),
                    ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?",
                    style: TextStyle(fontSize: 14),),
                    Text(" Sign up", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,

                    ),)
                  ],
                ),

              ],
            ))
          ],
        ),
      ),
    );
  }

}


// we will be creating a widget for text field
Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 40,
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            
          ),
        ),
      ),
      SizedBox(height: 10,)
    ],
  );

}