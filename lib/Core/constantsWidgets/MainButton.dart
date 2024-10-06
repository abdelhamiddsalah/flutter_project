import 'package:flutter/material.dart';

class Mainbutton extends StatelessWidget {
  const Mainbutton({super.key,required this.onPressed, 
  required this.text, 
  required this.color, 
  required this.width, 
   this.rad =16, required this.borderColor, 
   
  });
final  void Function()? onPressed;
final Widget text;
final Color color;
final double width;
final double rad;
final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(rad),
         border: Border.all( // Add border
          color: borderColor, // Border color set to blue
          width: 2.0, // Thickness of the border
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: text,
        )
    );
  }
}