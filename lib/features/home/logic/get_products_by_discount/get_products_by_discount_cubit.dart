import 'package:bloc/bloc.dart';
import 'package:holo_cart/features/home/data/models/get_products_by_discount_model.dart';
import 'package:holo_cart/features/home/data/repo/home_repo.dart';

part 'get_products_by_discount_state.dart';

class GetProductsByDiscountCubit extends Cubit<GetProductsByDiscountState> {
  final HomeRepo repo;
  GetProductsByDiscountCubit(this.repo) : super(GetProductsByDiscountInitial());

  getProductsByDiscount(final String discountPercentage) async {
    emit(GetProductsByDiscountLoading());

    final response = await repo.getProductsByDiscount(discountPercentage);
    response.fold((failure) {
      emit(GetProductsByDiscountError(failure.errorMessage));
    }, (responseBody) {
      emit(GetProductsByDiscountSuccess(responseBody));
    });
  }
}
