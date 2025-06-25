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
final class GetShippingAddressEmpty extends GetShippingAddressState {}


// States للحذف
final class DeleteShippingAddressLoading extends GetShippingAddressState {}

final class DeleteShippingAddressSuccess extends GetShippingAddressState {
  final ShippingAddressResponse response;
  DeleteShippingAddressSuccess(this.response);
}

final class DeleteShippingAddressError extends GetShippingAddressState {
  final String errorMessage;
  DeleteShippingAddressError(this.errorMessage);
}
