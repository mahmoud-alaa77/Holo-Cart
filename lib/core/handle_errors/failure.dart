import 'package:dio/dio.dart';

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
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to api server was canceled");
      case DioExceptionType.connectionError:
        return ServerFailure("No Internet Connection");
      case DioExceptionType.unknown:
        return ServerFailure("Connection Error");
        

      // ignore: unreachable_switch_default
      default:
        return ServerFailure("Opps There was an error, Please Try Again");
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure("Your request not found, please try Later");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server Error, Please Try Later");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure("This account hasn't exist");
    } else if (statusCode == 422) {
      return ServerFailure("Email or phone has already been taken");
    } else {
      return ServerFailure("Opps There was an error Please Try Again");
    }
  }
}
