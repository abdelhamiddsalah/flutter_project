import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Core/Api/DioConsumer.dart';
import 'package:flutter_project/Features/Authentication/Presentation/View_model/AuthCubit/auth_cubit_cubit.dart';
import 'package:flutter_project/Features/Authentication/Presentation/Views/widgets/Signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubitCubit(Dioconsumer(dio: Dio())),
      child: SignupViewBody(),
    );
  }
}
