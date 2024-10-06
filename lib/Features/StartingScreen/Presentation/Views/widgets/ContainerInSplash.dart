import 'package:flutter/material.dart';
import 'package:flutter_project/Core/Constants/Colors.dart';
import 'package:flutter_project/Core/constantsWidgets/Text.dart';
import 'package:lottie/lottie.dart';

class ContainerInsplash extends StatelessWidget {
  const ContainerInsplash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      height: 400,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 34),
        child: Column(
          children: [
            Lottie.asset(
              'assets/images/Animation - 1727792847036.json',
              width: 180,
              height: 180, 
            ),
               Container(
                
                child: Maintext(text: 'Start You Shopping Journey Now', fontWeight: FontWeight.bold,
                 size: 23, alignment: Alignment.center,color: Colors.white,)),
               SizedBox(height: 20,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
             SizedBox(
        width: 300,
         child: Maintext(text: 'Lorem ipsum dolor sit amet!',
          fontWeight: FontWeight.normal, size: 16, alignment: Alignment.center,color: Colors.white,),
             ),
                 ],
               )
        ],),
      ),
    );
  }
}