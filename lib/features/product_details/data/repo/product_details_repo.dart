import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:holo_cart/core/handle_errors/failure.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/features/product_details/data/models/get_product_colors_model.dart';
import 'package:holo_cart/features/product_details/data/models/review_request_model.dart';

class ProductDetailsRepo {
  final ApiService apiService;

  ProductDetailsRepo({required this.apiService});

  Future<Either<Failure, GetProductColorModel>> getProductColors(
      {required int id}) async {
    try {
      final response = await apiService.getProductColors(id.toString());
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }



  Future<Either<Failure, bool>> createReview(
      {required Review reviewBody}) async {
    try {
      final response = await apiService.addReview(reviewBody);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

}
