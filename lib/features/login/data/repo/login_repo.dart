import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:holo_cart/core/handle_errors/failure.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/features/login/data/models/login_request_body.dart';
import 'package:holo_cart/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<Either<Failure, LoginRespose>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(
        loginRequestBody.identifier,
        loginRequestBody.password,
      );

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
