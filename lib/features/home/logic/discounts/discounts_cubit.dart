import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/features/home/data/models/get_all_discount_model.dart';
import 'package:holo_cart/features/home/data/repo/home_repo.dart';

part 'discounts_state.dart';

class DiscountsCubit extends Cubit<DiscountsState> {
  final HomeRepo repo;
  DiscountsCubit(this.repo) : super(DiscountsInitial());

  getAllDiscounts() async {
    emit(DiscountsLoading());

    final response = await repo.getAllDiscounts();
    response.fold((failure) {
      emit(DiscountsError(failure.errorMessage));
    }, (responseBody) {
      emit(DiscountsLoaded(responseBody));
    });
  }
}
