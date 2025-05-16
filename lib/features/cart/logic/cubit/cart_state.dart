part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class GetCartItemsLoading extends CartState {}

final class GetCartItemsSuccess extends CartState {
  final List<CartItemModel> cartItems;
  GetCartItemsSuccess({required this.cartItems});
}

final class GetCartItemsFailure extends CartState {
  final String message;
  GetCartItemsFailure({required this.message});
}

final class RemoveAllCartItems extends CartState {}

final class RemoveCartItem extends CartState {}

// final class CalcTotal extends CartState {
//   final double total;
//   CalcTotal({required this.total});
// }
