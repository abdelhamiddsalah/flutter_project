import 'package:bloc/bloc.dart';
import 'package:flutter_project/Core/Api/ApiConsumer.dart';
import 'package:flutter_project/Core/Api/Endpoints.dart';
import 'package:flutter_project/Features/Home/data/models/Home_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  final Apiconsumer api;
  HomeCubitCubit(this.api) : super(HomeCubitInitial());
 Getproducts? getproducts;
  FetchProducts() async {
  try {
 SharedPreferences prefs= await SharedPreferences.getInstance();
 final String? token=  prefs.getString(ApiKeys.token);
    emit(HomeCubitLoading());
    final result = await api.get(Endpoints.getProductsHome,headers: {
      ApiKeys.autherzication:token,
      'lang': 'en'
    });
    final getproducts = Getproducts.fromJson(result);
    emit(HomeCubitSuccess(getproducts: getproducts));
  } catch (e) {
    emit(HomeCubitFailure(error: e.toString()));
  }
}
}
