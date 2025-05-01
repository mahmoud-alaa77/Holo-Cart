part of 'get_product_colors_cubit.dart';

@immutable
sealed class GetProductColorsState {}

final class GetProductColorsInitial extends GetProductColorsState {}

final class GetProductColorsLoading extends GetProductColorsState {}

final class GetProductColorsSuccess extends GetProductColorsState {
  final GetProductColorModel getProductColorModel;

  GetProductColorsSuccess(this.getProductColorModel);
}

final class GetProductColorsFailure extends GetProductColorsState {
  final String message;

  GetProductColorsFailure(this.message);
}
