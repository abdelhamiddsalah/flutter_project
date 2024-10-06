import 'package:flutter/material.dart';
import 'package:flutter_project/Core/constantsWidgets/Text.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Maintext(text: 'Forget Password?',
                     fontWeight: FontWeight.normal, size: 16, color: Colors.white,),
      ],
    );
  }
}