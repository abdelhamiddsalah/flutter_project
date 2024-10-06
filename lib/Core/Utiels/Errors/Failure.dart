
import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  // Factory constructor to create a ServerFailure from DioException
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessage: "Connection timed out. Please try again.");
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errorMessage: "Send timeout in connection with the server.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errorMessage: "Receive timeout in connection with the server.");
      case DioExceptionType.badResponse:
        // Handle 400-500 HTTP errors (bad response)
        return ServerFailure(
          errorMessage: _handleHttpError(dioException.response?.statusCode),
        );
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request to server was cancelled.");
      case DioExceptionType.badCertificate:
        return ServerFailure(
            errorMessage:
                "Bad certificate. Can't establish a secure connection.");
      case DioExceptionType.connectionError:
        return ServerFailure(
            errorMessage:
                "Failed to connect to the server. Please check your connection.");
      default:
        // Default case for other DioException types or unknown errors
        return ServerFailure(
            errorMessage: "Unexpected error occurred. Please try again.");
    }
  }

  // Helper method to handle HTTP status codes
  static String _handleHttpError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad request. Please check your input.";
      case 401:
        return "Unauthorized request. Please check your credentials.";
      case 403:
        return "Access forbidden. You don't have permission to access this resource.";
      case 404:
        return "Resource not found. Please check the URL.";
      case 500:
        return "Internal server error. Please try again later.";
      case 502:
        return "Bad gateway. The server is down or being upgraded.";
      case 503:
        return "Service unavailable. Please try again later.";
      case 504:
        return "Gateway timeout. Please check your connection.";
      default:
        return "Received an unknown error. Please try again.";
    }
  }
}
