import 'package:bloc/bloc.dart';
import 'package:holo_cart/core/helper/local_db_helper.dart';
import 'package:holo_cart/features/cart/data/models/cart_item_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> getCartItems() async {
    emit(GetCartItemsLoading());
    try {
      final cartItems = await DBHelper().getCartItems();
      emit(GetCartItemsSuccess(
          cartItems: cartItems.map((e) => CartItemModel.fromMap(e)).toList()));
    } catch (e) {
      emit(GetCartItemsFailure(message: e.toString()));
    }
  }
}
