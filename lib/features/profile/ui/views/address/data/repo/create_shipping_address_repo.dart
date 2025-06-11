import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:holo_cart/core/handle_errors/failure.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/create_shipping_address/shiping_address_requset.dart';

import '../models/create_shipping_address/shipping_address_response.dart';

class ShippingAddressRepo {
  final ApiService _apiService;
  ShippingAddressRepo(this._apiService);
  Future<Either<Failure, ShippingAddressResponse>> createShippingAddress(
      ShippingAddressRequest shippingAddressRequest) async {
    try {
  final response= await _apiService.createShippingAddress(shippingAddressRequest);
  return right(response);
} catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
      
    }
  }
}
