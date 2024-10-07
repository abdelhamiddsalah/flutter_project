import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Core/Constants/Colors.dart';
import 'package:flutter_project/Features/Authentication/Presentation/View_model/AuthCubit/auth_cubit_cubit.dart';
import 'package:flutter_project/Features/Authentication/Presentation/View_model/AuthCubit/auth_cubit_state.dart';
import 'package:flutter_project/Features/Authentication/Presentation/Views/widgets/ButtonLogout.dart';
import 'package:flutter_project/Features/Authentication/Presentation/Views/widgets/ContainerInprofilepage.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubitCubit, AuthCubitState>(builder: (context, state) {
      if (state is GetUserSuccess) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [    
               ContainerInprofilepage(),
                Column(
                  children: [
                    SizedBox(height: 60),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 60,
                      child: Text(
                        state.profileModel.data!.name![0].toUpperCase(),
                        style: TextStyle(color: mainColor, fontSize: 30),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.email, color: mainColor),
                              SizedBox(width: 25),
                              Text(
                                state.profileModel.data!.email!.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          SizedBox(height: 40),
                          Row(
                            children: [
                              Icon(Icons.person, color: mainColor),
                              SizedBox(width: 25),
                              Text(
                                state.profileModel.data!.name!.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          SizedBox(height: 40),
                          Row(
                            children: [
                              Icon(Icons.phone, color: mainColor),
                              SizedBox(width: 25),
                              Text(
                                state.profileModel.data!.phone!.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonLogout(),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      } else if (state is GetUserFailure) {
        return Center(
          child: Text(
            state.errMessage,
            style: TextStyle(fontSize: 24, color: Colors.red),
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

