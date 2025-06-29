import 'package:bloc/bloc.dart';
import 'package:holo_cart/features/product_details/data/models/review_request_model.dart';
import 'package:holo_cart/features/product_details/data/repo/product_details_repo.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  final ProductDetailsRepo repo;
  AddReviewCubit(this.repo) : super(AddReviewInitial());
Future<bool> addReview({required Review review}) async {
  emit(AddReviewLoading());

  final result = await repo.createReview(reviewBody: review);

  bool isSuccess = false;

  result.fold(
    (failure) {
      emit(AddReviewError(failure.errorMessage));
      isSuccess = false;
    },
    (getProductColorModel) {
      emit(AddReviewSuccess());
      isSuccess = true;
    },
  );

  return isSuccess;
}

}
