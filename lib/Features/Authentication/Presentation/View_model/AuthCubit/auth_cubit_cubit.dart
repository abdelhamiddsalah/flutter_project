import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Core/Api/ApiConsumer.dart';
import 'package:flutter_project/Core/Api/Endpoints.dart';
import 'package:flutter_project/Core/Cached/Cachedelper.dart';
import 'package:flutter_project/Features/Authentication/Presentation/View_model/AuthCubit/auth_cubit_state.dart';
import 'package:flutter_project/Features/Authentication/data/models/SignIn_model.dart';
import 'package:flutter_project/Features/Authentication/data/models/Signup_model.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  
  final Apiconsumer api;
  AuthCubitCubit( this.api) : super(UserInitial());
  final GlobalKey<FormState> signinformkey = GlobalKey();
  final GlobalKey<FormState> signupformkey = GlobalKey();
  final TextEditingController SigninEmail = TextEditingController();
  final TextEditingController SigninPassword = TextEditingController();
  final TextEditingController Signupuser = TextEditingController();
  final TextEditingController SignupEmail = TextEditingController();
  final TextEditingController SignupPassword = TextEditingController();
  final TextEditingController Signupphone = TextEditingController();
  SignInModel? signInModel;
  SignUpModel? signUpModel;

  signin() async {
  try {
    emit(SignInLoading());
    final response = await api.post(
      Endpoints.Signinbaseurl,
      data: {ApiKeys.email: SigninEmail.text, ApiKeys.password: SigninPassword.text,},
    );
    signInModel = SignInModel.fromJson(response);
    final String? token = signInModel?.data.token.toString();
    if (token != null) {
      CacheHelper().saveData(key: ApiKeys.token, value: token);
      emit(SignInSuccess());
    } else {
      emit(SignInFailure(errMessage: 'Token not found in response'));
    }
  } catch (e) {
    emit(SignInFailure(errMessage: e.toString()));
  }
}
////////////////////////////////////////////////////////
  signup()async{
  try {
    emit(SignUpLoading());
  final response=await  api.post(Endpoints.Signupbaseurl, data: { ApiKeys.email: SignupEmail.text,
  ApiKeys.password: SignupPassword.text,ApiKeys.phone: Signupphone.text,
  ApiKeys.name: Signupuser.text});
  signUpModel = SignUpModel.fromJson(response);
 final decoded= signUpModel!.data!.token.toString();
 CacheHelper().saveData(key: ApiKeys.token, value: decoded);
  emit(SignUpSuccess());
}  catch (e) {
  emit(SignUpFailure(errMessage: 'error'));
}
  }
  //////////////////////////////////////////////////////
 getProfile() async {
  try {
    emit(GetUserLoading());
    final String? token = CacheHelper().getData(key: ApiKeys.token);
    if (token == null) {
      emit(GetUserFailure(errMessage: 'Token not found'));
      return;
    }
    final result = await api.get(Endpoints.getprofileId, headers: {
      ApiKeys.autherzication: token,
    });
    final profileModel = SignUpModel.fromJson(result);
    emit(GetUserSuccess(profileModel: profileModel));
  } catch (e) {
    emit(GetUserFailure(errMessage: e.toString()));
  }
}
////////////////////////////////////////////////////////////////
  Future<void> logout() async {
    await CacheHelper().removeData(key: 'token');
    print('Token removed successfully');
  }

  Future<bool> checkLoginStatus() async {
    return CacheHelper().containsKey(key: 'token');
  }
}



