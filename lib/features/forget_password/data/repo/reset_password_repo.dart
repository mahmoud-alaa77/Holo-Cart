import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:holo_cart/core/handle_errors/failure.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/features/forget_password/data/models/forget_password_response.dart';
import 'package:holo_cart/features/forget_password/data/models/resetpassword/reset_password_request.dart';

class ResetPasswordRepo {
  final ApiService _apiService;
  ResetPasswordRepo(this._apiService);
  Future<Either<Failure, ForgetPasswordRespnse>> sendResetPasswordCode(
      ResetPasswordRequest resetPasswordRequest) async {
    try {
      final response = await _apiService.resetPassword(
          resetPasswordRequest.email!,
          resetPasswordRequest.password!,
          resetPasswordRequest.confirmPassword!);
      return Right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
