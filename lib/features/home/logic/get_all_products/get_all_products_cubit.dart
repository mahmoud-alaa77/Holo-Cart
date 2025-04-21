import 'package:bloc/bloc.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:holo_cart/features/home/data/repo/home_repo.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  final HomeRepo repo;
  GetAllProductsCubit(this.repo) : super(GetAllProductsInitial());

  getAllProducts() async {
    emit(GetAllProductsLoading());

    final response = await repo.getAllProducts();
    response.fold((failure) {
      emit(GetAllProductsFailure(failure.errorMessage));
    }, (responseBody) {
      emit(GetAllProductsSuccess(responseBody));
    });
  }
}
