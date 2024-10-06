import 'package:flutter_project/Features/Authentication/data/models/Signup_model.dart';

class AuthCubitState {}

final class UserInitial extends AuthCubitState {}

final class SignInSuccess extends AuthCubitState {}
final class SignInLoading extends AuthCubitState {}
final class SignInFailure extends AuthCubitState {
  final String errMessage;
  SignInFailure({required this.errMessage});
}


final class SignUpSuccess extends AuthCubitState {}
final class SignUpLoading extends AuthCubitState {}
final class SignUpFailure extends AuthCubitState {
  final String errMessage;
  SignUpFailure({required this.errMessage});
}


final class GetUserSuccess extends AuthCubitState {
  final SignUpModel profileModel;
 GetUserSuccess({required this.profileModel});
}
final class GetUserLoading extends AuthCubitState {}
final class GetUserFailure extends AuthCubitState {
  final String errMessage;
  GetUserFailure({required this.errMessage});
}
