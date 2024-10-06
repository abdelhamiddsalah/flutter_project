import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_project/Core/Api/ApiConsumer.dart';
import 'package:flutter_project/Core/Api/ApiInterceptor.dart';
import 'package:flutter_project/Core/Api/Endpoints.dart';
import 'package:flutter_project/Core/Utiels/Errors/Failure.dart';


class Dioconsumer extends Apiconsumer{
  final Dio dio;

  Dioconsumer({required this.dio}){
    dio.options.baseUrl=Endpoints.Signinbaseurl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
    requestHeader: true,
    request: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true
    ));
  }
  @override
  Future delete(String path, {dynamic data, bool isFormdata=false, Map<String, dynamic>? queryParameters})async{
   try {
  final response = await dio.delete(path, data:isFormdata?FormData.fromMap(data): data, queryParameters: queryParameters);
  return response.data;
} on DioException catch (e) {
// handleDioExceptions(e);
}
  }

 @override
Future get(String path, {Object? data,Map<String, dynamic>? queryParameters,dynamic headers,}) async {
  try {
    final response = await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return response.data;
  } on DioException catch (e) {
     ServerFailure(errorMessage: e.toString());
  }
}



  @override
  Future patch(String path, {dynamic data, bool isFormdata=false, Map<String, dynamic>? queryParameters})async{
 try {
  final response = await dio.patch(path, data:isFormdata?FormData.fromMap(data): data, queryParameters: queryParameters);
  return response.data;
} on DioException catch (e) {
ServerFailure;
}
  }

  @override
  Future post(String path, {dynamic data, bool isFormdata=false, Map<String, dynamic>? queryParameters})async{
   try {
    final response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
   return response.data;
  } on DioException catch (e) {
   ServerFailure(errorMessage: 'errooooooooooooo');
  }
  }
  
}