part of 'shipping_address_cubit.dart';

@immutable
sealed class ShippingAddressState {}

final class ShippingAddressInitial extends ShippingAddressState {}
final class ShippingAddressLoading extends ShippingAddressState {}
final class ShippingAddressSuccess extends ShippingAddressState {
  final ShippingAddressResponse response;

  ShippingAddressSuccess(this.response);
}
final class ShippingAddressFailure extends ShippingAddressState {
  final String error;

  ShippingAddressFailure(this.error);
}
