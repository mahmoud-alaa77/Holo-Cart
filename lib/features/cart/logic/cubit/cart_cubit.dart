import 'package:bloc/bloc.dart';
import 'package:holo_cart/core/helper/local_db_helper.dart';
import 'package:holo_cart/features/cart/data/models/cart_item_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartItemModel> cartItemsList = [];
  Future<void> getCartItems() async {
    emit(GetCartItemsLoading());
    try {
      final cartItems = await DBHelper().getCartItems();
      cartItemsList = cartItems.map((e) => CartItemModel.fromMap(e)).toList();

      emit(GetCartItemsSuccess(cartItems: cartItemsList));
    } catch (e) {
      emit(GetCartItemsFailure(message: e.toString()));
    }
  }

  Future<void> deleteItem(String productId) async {
    await DBHelper().deleteItem(productId);
    await getCartItems();
  }

  Future<void> clearCart() async {
    await DBHelper().clearCart();
    await getCartItems();
  }
}
