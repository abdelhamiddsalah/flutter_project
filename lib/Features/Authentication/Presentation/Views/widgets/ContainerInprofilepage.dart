import 'package:flutter/material.dart';
import 'package:flutter_project/Core/Constants/Colors.dart';

class ContainerInprofilepage extends StatelessWidget {
  const ContainerInprofilepage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 67, 92, 217),
            mainColor,
          ],
          begin: Alignment.topCenter,   
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
    );
  }
}