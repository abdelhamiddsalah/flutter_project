import 'package:flutter/material.dart';
import 'package:flutter_project/Features/StartingScreen/Presentation/Views/widgets/ButtonsInSplash.dart';
import 'package:flutter_project/Features/StartingScreen/Presentation/Views/widgets/ContainerInSplash.dart';

class TopPartInstartingscreen extends StatelessWidget {
  const TopPartInstartingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ContainerInsplash(),
          SizedBox(height: 40,),
         ButtonsInSplash()
        ],
      ),
    );
  }
}


