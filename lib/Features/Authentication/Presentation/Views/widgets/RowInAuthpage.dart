import 'package:flutter/material.dart';
import 'package:flutter_project/Core/constantsWidgets/Text.dart';

class Rowinauthpage extends StatelessWidget {
  const Rowinauthpage({super.key, required this.text, this.onPressed, required this.text2});
 final String text;
 final String text2;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Maintext(text: text, fontWeight: FontWeight.w400, size: 15, color: Colors.black87,),
        MaterialButton(onPressed: onPressed, child: Maintext(text: text2, fontWeight: FontWeight.w700, size: 18, color: Colors.black87,),)
      ],
    );
  }
}