import 'package:flutter/material.dart';
import 'package:flutter_project/Features/StartingScreen/Presentation/Views/widgets/Top_part_instartingscreen.dart';

class StartingscreenViewBody extends StatelessWidget {
  const StartingscreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body:  SingleChildScrollView(
     child: Column(
          children: [
            TopPartInstartingscreen()
          ],
        ),
   ),
    );
  }
}