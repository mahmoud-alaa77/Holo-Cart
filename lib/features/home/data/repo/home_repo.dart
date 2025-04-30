import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:holo_cart/core/handle_errors/failure.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/features/home/data/models/category_model.dart';
import 'package:holo_cart/features/home/data/models/get_all_discount_model.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:holo_cart/features/home/data/models/get_products_by_discount_model.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo(this.apiService);

  Future<Either<Failure, CategoryModel>> getAllCategories() async {
    try {
      final response = await apiService.getCategories();
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, GetAllProductsModel>> getAllProducts() async {
    try {
      final response = await apiService.getAllProducts();
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, GetAllDiscountsModel>> getAllDiscounts() async {
    try {
      final response = await apiService.getAllDiscounts();
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, GetProductsByDiscountModel>> getProductsByDiscount(
      final String discountPercentage) async {
    try {
      final response =
          await apiService.getProductsByDiscount(discountPercentage);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, GetAllProductsModel>> getAllProductsInCategory(
      {required int id}) async {
    try {
      final response = await apiService.getProductsByCategory(id.toString());
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
