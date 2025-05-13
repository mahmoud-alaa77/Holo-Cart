import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:holo_cart/core/handle_errors/failure.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/features/profile/data/model/update_profile_model/update_profile_model.dart';

class UpdateProfileRepo{
  final ApiService _apiService;

  UpdateProfileRepo(this._apiService);
  Future<Either<Failure, Unit>> updateProfile(UpdateProfileRequest data) async {
  try {
    await _apiService.updateProfile(
      id: data.id,
      fullName: data.fullName,
      userName: data.userName,
      phoneNumber: data.phoneNumber,
      address: data.address,
      profileImage: data.profileImage,
    );
    return right(unit);
  } catch (error) {
    if (error is DioException) {
      return left(ServerFailure.fromDioError(error));
    }
    return left(ServerFailure(error.toString()));
  }
}
}