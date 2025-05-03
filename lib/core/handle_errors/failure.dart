import 'package:dio/dio.dart';
import 'package:holo_cart/core/networking/api_error_model.dart';

abstract class Failure {
  final String errorMessage;
  
  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
  
   factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection time out with api server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send time out with api server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive time out with api server");
      case DioExceptionType.badCertificate:
        return ServerFailure("Internal Server Error");
      case DioExceptionType.badResponse:
        if (dioError.response?.statusCode == 307 || dioError.response?.statusCode == 308) {
          return ServerFailure("Redirect error - please try again");
        }
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to api server was canceled");
      case DioExceptionType.connectionError:
        return ServerFailure("No Internet Connection");
      case DioExceptionType.unknown:
        if (dioError.response?.statusCode == 307 || dioError.response?.statusCode == 308) {
          return ServerFailure("Redirect error - please try again");
        }
        return ServerFailure("Connection Error");
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    try {
      final apiError = ApiErrorModel.fromJson(response as Map<String, dynamic>);
      final message = apiError.message ?? ServerFailure._getDefaultMessage(statusCode);
      return ServerFailure(message);
    } catch (e) {
      return ServerFailure(ServerFailure._getDefaultMessage(statusCode));
    }
  }

  static String _getDefaultMessage(int? statusCode) {
    if (statusCode == 404) {
      return "Your request not found, please try later";
    } else if (statusCode == 500) {
      return "Internal Server Error, please try later";
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return "This account doesn't exist";
    } else if (statusCode == 422) {
      return "Email or phone has already been taken";
    } else {
      return "Oops! There was an error, please try again";
    }
  }
}