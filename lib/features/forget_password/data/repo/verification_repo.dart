import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:holo_cart/core/handle_errors/failure.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/features/forget_password/data/models/forget_password_response.dart';
import 'package:holo_cart/features/forget_password/data/models/verify/verification_requst.dart';

class VerificationRepo {
  final ApiService _apiService;
  VerificationRepo(this._apiService);
  Future<Either<Failure, ForgetPasswordRespnse>> sendResetPasswordCode(
      VerificationRequst verificationRequst) async {
    try {
      final response = await _apiService.confirmResetPasswordCode(
          verificationRequst.email, verificationRequst.code);
      return Right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
