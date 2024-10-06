import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Core/Api/DioConsumer.dart';
import 'package:flutter_project/Features/Home/Presentation/Views/widgets/Home_view_body.dart';
import 'package:flutter_project/Features/Home/Presentation/Views_model/HomeCubit/home_cubit_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubitCubit(Dioconsumer(dio: Dio()))..FetchProducts(),
      child: HomeViewBody(),
    );
  }
}
