part of 'get_products_in_category_cubit.dart';

@immutable
sealed class GetProductsInCategoryState {}

final class GetProductsInCategoryInitial extends GetProductsInCategoryState {}

final class GetProductsInCategoryLoading extends GetProductsInCategoryState {}

final class GetProductsInCategorySuccess extends GetProductsInCategoryState {
  final GetAllProductsModel allProductsModel;
  GetProductsInCategorySuccess({required this.allProductsModel});
}

final class GetProductsInCategoryError extends GetProductsInCategoryState {
  final String message;
  GetProductsInCategoryError({required this.message});
}
