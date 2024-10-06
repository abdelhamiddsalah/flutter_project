
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Core/Constants/Colors.dart';
import 'package:flutter_project/Core/constantsWidgets/Text.dart';
import 'package:flutter_project/Features/Authentication/Presentation/View_model/AuthCubit/auth_cubit_cubit.dart';
import 'package:flutter_project/Features/Authentication/Presentation/View_model/AuthCubit/auth_cubit_state.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubitCubit, AuthCubitState>(builder: (context, state) {
      if (state is GetUserSuccess) {
        return SafeArea(
          child: Scaffold(
            
            backgroundColor: mainColor,
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Maintext(text: 'Profile', fontWeight: FontWeight.bold, size: 28),
                      SizedBox(height: 24,),
                     CircleAvatar(backgroundColor: Colors.white,
                     child:  Text(state.profileModel.data!.name![0].toUpperCase(), style: TextStyle(color: mainColor),),)
                    ],
                  )),
                 SizedBox(height: 25,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Email: ${state.profileModel.data!.email!.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
                      SizedBox(height: 20,),
                       Text('Name: ${state.profileModel.data!.name!.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
                      SizedBox(height: 20,),
                      Text('Number Phone: ${state.profileModel.data!.phone!.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      } else if (state is GetUserFailure) {
        return Center(
            child: Text(
          state.errMessage,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ));
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
