import 'package:flutter/material.dart';
import 'package:flutter_project/Core/Constants/Colors.dart';
import 'package:flutter_project/Features/Home/Presentation/Views/widgets/StackIncontainer.dart';

class ContentsHome extends StatelessWidget {
  const ContentsHome({ super.key, });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: mainColor
      ),
      child: StackIncontainer(),
    );
  }
}
