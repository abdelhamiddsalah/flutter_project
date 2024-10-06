import 'package:flutter/material.dart';
import 'package:flutter_project/Core/Constants/Colors.dart';
import 'package:flutter_project/Core/constantsWidgets/Text.dart';

class Rowcategories extends StatelessWidget {
  const Rowcategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Maintext(text: 'Categories', fontWeight: FontWeight.bold, size: 22),
        Maintext(text: 'See All', fontWeight: FontWeight.w500, size: 16, color: mainColor,),
      ],
    );
  }
}