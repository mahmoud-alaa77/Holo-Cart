import 'package:bloc/bloc.dart';
import 'package:holo_cart/features/product_details/data/models/get_product_colors_model.dart';
import 'package:holo_cart/features/product_details/data/repo/product_details_repo.dart';
import 'package:meta/meta.dart';

part 'get_product_colors_state.dart';

class GetProductColorsCubit extends Cubit<GetProductColorsState> {
  final ProductDetailsRepo productDetailsRepo;
  GetProductColorsCubit({required this.productDetailsRepo})
      : super(GetProductColorsInitial());

  getProductColors(int id) async {
    emit(GetProductColorsLoading());
    final result = await productDetailsRepo.getProductColors(id: id);
    result.fold((failure) {
      emit(GetProductColorsFailure(failure.errorMessage));
    }, (getProductColorModel) {
      emit(GetProductColorsSuccess(getProductColorModel));
    });
  }
}
