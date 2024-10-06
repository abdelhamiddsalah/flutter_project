

abstract class Apiconsumer {
Future<dynamic> get(
    String path, {
      Object? data,
      Map<String, dynamic>? queryParameters,
      dynamic headers
      // bool isFormdata=false,  
    }
  );
 Future<dynamic> post(
     String path, {
      Object? data,
      Map<String, dynamic>? queryParameters,
       bool isFormdata =false,
    }
  );
Future<dynamic>  patch(
     String path, {
      Object? data,
      Map<String, dynamic>? queryParameters,
       bool isFormdata =false,
    }
  );
 Future<dynamic> delete(
     String path, {
      Object? data,
      Map<String, dynamic>? queryParameters,
       bool isFormdata =false,
    }
  );
}