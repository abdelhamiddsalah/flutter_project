import 'package:flutter/material.dart';
import 'package:flutter_project/Core/Constants/Colors.dart';
import 'package:flutter_project/Core/constantsWidgets/MainButton.dart';
import 'package:flutter_project/Core/constantsWidgets/Text.dart';
import 'package:go_router/go_router.dart';

class ButtonsInSplash extends StatelessWidget {
  const ButtonsInSplash({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
     Mainbutton(onPressed: (){
    GoRouter.of(context).push('/login');
     },
      text: Maintext(text: 'Log In', fontWeight: FontWeight.bold, size: 16,color: Colors.white,), 
      color: mainColor, width: 350, borderColor: mainColor,),


      SizedBox(height: 30,),

      
      Mainbutton(onPressed: (){
         GoRouter.of(context).push('/signup');
      },
      text: Maintext(text: 'Sign Up', fontWeight: FontWeight.bold, size: 16, color: Colors.white,), 
      color: buttonColor, width: 350, borderColor:buttonColor,),
     ],
    );
  }
}