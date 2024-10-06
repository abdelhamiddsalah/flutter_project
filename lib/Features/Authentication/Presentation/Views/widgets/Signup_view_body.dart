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

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubitCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("success"),   
              ),
              
            );
        GoRouter.of(context).push('/homeview');
          } else if (state is SignUpFailure) {
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
            padding: EdgeInsets.all(20),
            child: Form(
              key: context.read<AuthCubitCubit>().signupformkey,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Maintext(
                            text: 'Sign Up',
                            fontWeight: FontWeight.w900,
                            size: 33,color: Colors.white,),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Maintext(
                      text:
                          'Create an account so you can order you favorite products easily and quickly.',
                      fontWeight: FontWeight.normal,
                      size: 15,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Textfieldinauth(
                      validator: (value) {
  
  if (value == null || value.isEmpty) {
    return 'Please enter a username';
  }
  

  if (value.length < 3 || value.length > 15) {
    return 'Username must be between 3 and 15 characters';
  }
  if (!RegExp(r'^[a-zA-Z0-9._]+$').hasMatch(value)) {
    return 'Username can only contain letters, numbers, ".", and "_"';
  }

  if (value.contains(' ')) {
    return 'Username cannot contain spaces';
  }

  return null;
},
                      title: 'User Name',
                      preicon: Icon(Icons.person),
                      control: context.read<AuthCubitCubit>().Signupuser,
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Textfieldinauth(
                      preicon: Icon(Icons.email),
                      title: 'email',
                      control: context.read<AuthCubitCubit>().SignupEmail,
                      validator:  (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  String pattern =
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Textfieldinauth(
                      preicon: Icon(Icons.remove_red_eye_outlined),
                       sufficon: Icon(Icons.remove_red_eye),
                      title: 'password',
                      bol: true,
                      control: context.read<AuthCubitCubit>().SignupPassword,
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
                    return 'Password must contain at least one special character (!, @, #, etc.)';
                  }
                  return null;
                },
                    ),
                    SizedBox(height: 13,),
                     Textfieldinauth(
                      preicon: Icon(Icons.phone),
                      title: 'Phone',
                      keyType:  TextInputType.phone,
                      validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length < 10) {
                    return 'Phone number must be at least 10 digits';
                  }
                
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Phone number must contain only digits';
                  }
                  return null;
                },
                      control: context.read<AuthCubitCubit>().Signupphone,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ForgetPassword(),
                    SizedBox(
                      height: 15,
                    ),
                    Mainbutton(
                        onPressed: () {
                         context.read<AuthCubitCubit>().signup();
                        },
                        text: Maintext(
                          text: 'Sign Up',
                          fontWeight: FontWeight.bold,
                          size: 16,
                          color: Colors.white,
                        ),
                        color: buttonColor,
                        width: 350,
                        borderColor: mainColor),
                        SizedBox(height: 17,),
                        Rowinauthpage(text: 'Already Have an Account?', text2: 'Sign In',onPressed: () {
                          GoRouter.of(context).go('/login');
                        },),
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
