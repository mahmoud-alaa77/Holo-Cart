part of 'get_shipping_address_cubit.dart';

@immutable
sealed class GetShippingAddressState {}

final class GetShippingAddressInitial extends GetShippingAddressState {}
final class GetShippingAddressLoading extends GetShippingAddressState {}
final class GetShippingAddressLoaded extends GetShippingAddressState {
  final GetAddressResponseModel getAddressResponseModel;

  GetShippingAddressLoaded(this.getAddressResponseModel);
}
final class GetShippingAddressError extends GetShippingAddressState {
  final String errorMessage;

  GetShippingAddressError(this.errorMessage);
}

