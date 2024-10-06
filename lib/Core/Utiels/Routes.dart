import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Features/Authentication/Presentation/View_model/AuthCubit/auth_cubit_cubit.dart';
import 'package:flutter_project/Features/Authentication/Presentation/Views/Login_view.dart';
import 'package:flutter_project/Features/Authentication/Presentation/Views/Profile_view.dart';
import 'package:flutter_project/Features/Authentication/Presentation/Views/Signup_view.dart';
import 'package:flutter_project/Features/Home/Presentation/Views/Home_view.dart';
import 'package:flutter_project/Features/StartingScreen/Presentation/Views/Splash_view.dart';
import 'package:flutter_project/Features/StartingScreen/Presentation/Views/StartingScreen_view.dart';
import 'package:go_router/go_router.dart';

abstract class Approutes {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return FutureBuilder<bool>(
            future: context.read<AuthCubitCubit>().checkLoginStatus(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('error'));
              } else {
                final isLoggedIn = snapshot.data ?? false;
                return isLoggedIn ? const HomeView() : const SplashViewBody();
              }
            },
          );
        },
      ),
      GoRoute(
        path: '/signup',
        builder: (BuildContext context, GoRouterState state) {
          return const SignupView();
        },
      ),
     GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: '/homeview',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: '/starting',
        builder: (BuildContext context, GoRouterState state) {
          return const Startingscreen();
        },
      ),
      GoRoute(
        path: '/splash',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashViewBody();
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileView();
        },
      ),
    ],
  );
}
