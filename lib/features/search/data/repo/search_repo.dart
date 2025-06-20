import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:holo_cart/core/handle_errors/failure.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';

class SearchRepo {
  final ApiService apiService;
  SearchRepo(this.apiService);

  Future<Either<Failure, GetAllProductsModel>> search(
      {required int userId, required String searchTerm}) async {
    try {
      final response = await apiService.search(userId, searchTerm);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
