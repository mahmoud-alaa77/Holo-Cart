
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:holo_cart/core/handle_errors/failure.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/create_shipping_address/shipping_address_response.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/display_shipping_address/get_address_response_model.dart';

class GetShippingAddressRepo {
  final ApiService _apiService;
  GetShippingAddressRepo(this._apiService);
  Future<Either<Failure, GetAddressResponseModel?>> getShippingAddress(String id) async {
    try {
      final response = await _apiService.getShippingAddress(id);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        // إذا كان 404 - إرجاع null بدلاً من error (بغض النظر عن الرسالة)
        if (error.response?.statusCode == 404) {
          return right(null); // لا توجد عناوين
        }
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
  Future<Either<Failure, ShippingAddressResponse>> deleteShippingAddress(
      int id) async {
    try {
      final response = await _apiService.deleteShippingAddress(id);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}