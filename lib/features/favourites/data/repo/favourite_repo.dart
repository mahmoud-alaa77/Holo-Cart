import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:holo_cart/core/handle_errors/failure.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/features/favourites/data/models/add_or_delete_fav_body.dart';
import 'package:holo_cart/features/favourites/data/models/get_favourites_model.dart';

class FavouriteRepo {
  final ApiService apiService;

  FavouriteRepo(this.apiService);

  Future<Either<Failure, GetFavouriteModel>> getAllFavouriteProducts(
      {required int id}) async {
    try {
      final response = await apiService.getAllFavouriteProducts(id.toString());
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  addFavouriteProducts({required AddOrDeleteFavBody body}) async {
    try {
      final response = await apiService.addProductToFavourite(body);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  deleteFavouriteProducts({required AddOrDeleteFavBody body}) async {
    try {
      final response = await apiService.deleteProductFromFavourite(body);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
