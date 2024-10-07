import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Core/Constants/Colors.dart';
import 'package:flutter_project/Core/constantsWidgets/Text.dart';
import 'package:flutter_project/Features/Authentication/Presentation/View_model/AuthCubit/auth_cubit_cubit.dart';
import 'package:go_router/go_router.dart';

class ButtonLogout extends StatelessWidget {
  const ButtonLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        BlocProvider.of<AuthCubitCubit>(context).logout();
        GoRouter.of(context).go('/starting');
      },
      child: Container(
        decoration: BoxDecoration(
             gradient: LinearGradient(
             colors: [
              const Color.fromARGB(255, 67, 92, 217),
             mainColor,
            ],
             begin: Alignment.topLeft,   
             end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: EdgeInsets.all(13),
          child: Maintext(
            text: 'LogOut',
            fontWeight: FontWeight.w600,
            size: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


