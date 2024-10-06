part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}
final class HomeCubitLoading extends HomeCubitState {}
final class HomeCubitSuccess extends HomeCubitState {
  final Getproducts getproducts;
  HomeCubitSuccess({required this.getproducts});
}
final class HomeCubitFailure extends HomeCubitState {
  final String error;
  HomeCubitFailure({required this.error});
}
