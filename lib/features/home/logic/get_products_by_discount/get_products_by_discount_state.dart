part of 'get_products_by_discount_cubit.dart';

sealed class GetProductsByDiscountState {}

final class GetProductsByDiscountInitial extends GetProductsByDiscountState {}

final class GetProductsByDiscountLoading extends GetProductsByDiscountState {}

final class GetProductsByDiscountSuccess extends GetProductsByDiscountState {
  final GetProductsByDiscountModel getProductsByDiscountModel;
  GetProductsByDiscountSuccess(this.getProductsByDiscountModel);
}

final class GetProductsByDiscountError extends GetProductsByDiscountState {
  final String error;
  GetProductsByDiscountError(this.error);
}
