import 'package:flutter/material.dart';
import 'package:flutter_project/Core/Constants/Colors.dart';
import 'package:flutter_project/Core/constantsWidgets/Text.dart';

class StackIncontainer extends StatelessWidget {
  const StackIncontainer({super.key,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          left: 20,
          child: Maintext(text: 'Clearance', fontWeight: FontWeight.w500, size: 33, color: Colors.white,)),
          Positioned(
          top: 70,
          left: 20,
          child: Maintext(text: 'Sales', fontWeight: FontWeight.w500, size: 27, color: Colors.white,)),
          Positioned(
            bottom: 20,
            left: 6,
            child: MaterialButton(onPressed: (){}, child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Maintext(text: '% Up to 50%', fontWeight: FontWeight.normal, size: 16, color: mainColor,),
              ),
            ),),
          ),
           Positioned(
            top:10,
            right: 10,
            child: Image.asset('assets/images/photo-1664363535302-6f71e41a176a.png', width: 140,height: 190,fit: BoxFit.cover,),
          )
      ],
    );
  }
}
