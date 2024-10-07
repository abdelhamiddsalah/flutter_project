import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Core/Constants/Colors.dart';
import 'package:flutter_project/Core/constantsWidgets/MainButton.dart';
import 'package:flutter_project/Core/constantsWidgets/Text.dart';
import 'package:flutter_project/Features/Authentication/Presentation/View_model/AuthCubit/auth_cubit_cubit.dart';
import 'package:flutter_project/Features/Authentication/Presentation/View_model/AuthCubit/auth_cubit_state.dart';
import 'package:flutter_project/Features/Authentication/Presentation/Views/widgets/ForgetPassword.dart';
import 'package:flutter_project/Features/Authentication/Presentation/Views/widgets/RowInAuthpage.dart';
import 'package:flutter_project/Features/Authentication/Presentation/Views/widgets/TextFieldInauth.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
           var cubit = context.read<AuthCubitCubit>();
    return BlocConsumer<AuthCubitCubit, AuthCubitState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Login successful!")),
            );
            GoRouter.of(context).go('/bottombar');
          } else if(state is SignInLoading){
           ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Loading!")),
            );
          }
          else if (state is SignInFailure) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: state.errMessage,
              btnCancelOnPress: () {},
              btnCancelColor: buttonColor,
              btnOkColor: mainColor,
              btnOkOnPress: () {},
            ).show();
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: mainColor,
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: cubit.signinformkey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 90),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Maintext(
                          text: 'Welcome back!',
                          fontWeight: FontWeight.w900,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Maintext(
                          text: 'Sign in to your account.',
                          fontWeight: FontWeight.normal,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Textfieldinauth(
                        title: 'email',
                        preicon: const Icon(Icons.email),
                        control: cubit.SigninEmail,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 13),
                      Textfieldinauth(
                        title: 'password',
                        preicon: const Icon(Icons.lock),
                        sufficon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility_off),
                        ),
                        bol: true,
                        control: cubit.SigninPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return 'Password must contain at least one uppercase letter';
                          }
                          if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return 'Password must contain at least one lowercase letter';
                          }
                          if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Password must contain at least one number';
                          }
                          if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                            return 'Password must contain at least one special character';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      const ForgetPassword(),
                      const SizedBox(height: 20),
                     state is SignInSuccess
                          ? const CircularProgressIndicator()
                          : Mainbutton(
                              onPressed: () {
                                if (cubit.signinformkey.currentState!.validate()) {
                                  cubit.signin();
                                }
                              },
                              text: const Maintext(
                                text: 'Log In',
                                fontWeight: FontWeight.bold,
                                size: 16,
                                color: Colors.white,
                              ),
                              color: buttonColor,
                              width: 370,
                              borderColor: mainColor,
                            ),
                      const SizedBox(height: 17),
                      Rowinauthpage(
                        text: 'Create an Account?',
                        text2: 'Sign Up',
                        onPressed: () {
                          GoRouter.of(context).go('/signup');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    
  }
}
