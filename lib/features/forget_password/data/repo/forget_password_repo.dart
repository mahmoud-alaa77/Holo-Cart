import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:holo_cart/core/handle_errors/failure.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/features/forget_password/data/models/forget_password_request.dart';
import 'package:holo_cart/features/forget_password/data/models/forget_password_response.dart';

class ForgetPasswordRepo {
  final ApiService apiService;

  ForgetPasswordRepo( this.apiService);
  Future<Either< Failure, ForgetPasswordRespnse>>forgetPassword( ForgetPasswordRequest forgetPasswordRequest)async
  {
    try {
  final response =await apiService.sendResetPasswordCode(forgetPasswordRequest.email);
  return right(response);
} catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }


  }
}