import 'package:bloc/bloc.dart';
import 'package:holo_cart/features/home/data/models/product_model.dart';
import 'package:holo_cart/features/home/data/repo/home_repo.dart';

part 'get_product_by_id_state.dart';

class GetProductByIdCubit extends Cubit<GetProductByIdState> {
  final HomeRepo repo;
  GetProductByIdCubit(this.repo) : super(GetProductByIdInitial());

  getProductById({required int productId}) async {
    emit(GetProductByIdLoading());

    final response = await repo.getProductById(
      productId: productId,
    );
    response.fold((failure) {
      emit(GetProductByIdError(errorMessage: failure.errorMessage));
    }, (responseBody) {
      emit(GetProductByIdSuccess(productModel: responseBody));
    });
  }
}
