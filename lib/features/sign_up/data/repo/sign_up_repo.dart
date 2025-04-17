import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:holo_cart/core/handle_errors/failure.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/features/sign_up/data/model/sign_up_request.dart';
import 'package:holo_cart/features/sign_up/data/model/sign_up_response.dart';

class SignUpRepo {
  final ApiService apiService;
  SignUpRepo( this.apiService);
  Future<Either<Failure,SignUpResponse>> signUp(SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await apiService.signUp(signUpRequestBody);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

}