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
      ShippingAddressRequest request) async {
    try {
      final response = await _apiService.createShippingAddress(request);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

Future<Either<Failure, ShippingAddressResponse>> updateShippingAddress(
    ShippingAddressRequest req) async {
  try {
    final response = await _apiService.updateShippingAddress(req);
    return right(response);
  } catch (error) {
    if (error is DioException) {
      return left(ServerFailure.fromDioError(error));
    }
    return left(ServerFailure(error.toString()));
  }
}
  



}

