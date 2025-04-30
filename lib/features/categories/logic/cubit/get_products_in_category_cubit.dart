import 'package:bloc/bloc.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:holo_cart/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'get_products_in_category_state.dart';

class GetProductsInCategoryCubit extends Cubit<GetProductsInCategoryState> {
  final HomeRepo homeRepo;
  GetProductsInCategoryCubit(this.homeRepo)
      : super(GetProductsInCategoryInitial());

  Future<void> getAllProductsInCategory({required int id}) async {
    emit(GetProductsInCategoryLoading());
    final result = await homeRepo.getAllProductsInCategory(id: id);
    result.fold((failure) {
      emit(GetProductsInCategoryError(message: failure.errorMessage));
    }, (products) {
      emit(GetProductsInCategorySuccess(allProductsModel: products));
    });
  }
}
