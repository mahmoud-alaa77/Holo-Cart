import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/features/home/data/models/category_model.dart';
import 'package:holo_cart/features/home/data/repo/home_repo.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  final HomeRepo homeRepo;
  GetCategoriesCubit(this.homeRepo) : super(GetCategoriesInitial());

  getCategories() async {
    emit(GetCategoriesLoading());

    final response = await homeRepo.getAllCategories();
    response.fold((failure) {
      emit(GetCategoriesError(failure.errorMessage));
    }, (responseBody) {
      emit(GetCategoriesSuccess(responseBody));
    });
  }
}
