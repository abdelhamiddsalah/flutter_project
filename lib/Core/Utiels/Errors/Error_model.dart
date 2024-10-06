import 'package:flutter_project/Core/Api/Endpoints.dart';

class ErrorModel {
 final bool? status;
final  String? message;
 final Null data;

  ErrorModel({required this.status,required this.message,required this.data});

 factory ErrorModel.fromJson(Map<String, dynamic> jsondata) {
   return ErrorModel(
    status: jsondata[ApiKeys.status], 
    message: jsondata[ApiKeys.message],
     data: jsondata['data']
     );
  }
}