import 'package:flutter/material.dart';

class Maintext extends StatelessWidget {
  const Maintext({super.key, required this.text,
   required this.fontWeight, 
    this.color=Colors.black, required this.size,  this.alignment =Alignment.center,  this.maxl=2});
  final String text;
  final FontWeight fontWeight;
  final Color? color;
  final double size;
  final Alignment alignment;
  final int maxl;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(text, maxLines: maxl,style: TextStyle(fontSize: size, fontWeight:  fontWeight, color: color),));
  }
}