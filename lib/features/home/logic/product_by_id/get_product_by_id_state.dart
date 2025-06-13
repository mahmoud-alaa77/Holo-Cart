part of 'get_product_by_id_cubit.dart';

sealed class GetProductByIdState {}

final class GetProductByIdInitial extends GetProductByIdState {}

final class GetProductByIdLoading extends GetProductByIdState {}

final class GetProductByIdSuccess extends GetProductByIdState {
  final ProductModel productModel;
  GetProductByIdSuccess({required this.productModel});
}

final class GetProductByIdError extends GetProductByIdState {
  final String errorMessage;
  GetProductByIdError({required this.errorMessage});
}
