import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:holo_cart/core/handle_errors/failure.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/features/profile/data/model/get_profile_model/profile_response_model.dart';

class ProfileRepo {
  final ApiService _apiService;

  ProfileRepo(this._apiService);

  Future<Either<Failure, UserProfileResponseModel?>> getUserProfile(
      String userId) async {
    try {
      final response = await _apiService.getUserById(userId);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        // إذا كان 404 - إرجاع null بدلاً من error
        if (error.response?.statusCode == 404) {
          return right(null); 
        }
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}