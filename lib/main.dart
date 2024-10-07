import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Core/Api/DioConsumer.dart';
import 'package:flutter_project/Core/Cached/Cachedelper.dart';
import 'package:flutter_project/Core/Utiels/Routes.dart';
import 'package:flutter_project/Features/Authentication/Presentation/View_model/AuthCubit/auth_cubit_cubit.dart';
import 'package:flutter_project/Features/Home/Presentation/Views_model/HomeCubit/home_cubit_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubitCubit(Dioconsumer(dio: Dio())),
        ),
         BlocProvider(
        create: (context) => HomeCubitCubit(Dioconsumer(dio: Dio())),
         ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        routerConfig: Approutes.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
