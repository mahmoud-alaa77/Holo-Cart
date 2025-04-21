part of 'get_all_products_cubit.dart';

sealed class GetAllProductsState {}

final class GetAllProductsInitial extends GetAllProductsState {}

final class GetAllProductsLoading extends GetAllProductsState {}

final class GetAllProductsSuccess extends GetAllProductsState {
  final GetAllProductsModel getAllProductsModel;
  GetAllProductsSuccess(this.getAllProductsModel);
}

final class GetAllProductsFailure extends GetAllProductsState {
  final String errorMessage;
  GetAllProductsFailure(this.errorMessage);
}
