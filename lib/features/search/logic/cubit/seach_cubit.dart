import 'package:bloc/bloc.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:holo_cart/features/search/data/repo/search_repo.dart';

part 'seach_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitial());

  search({required String searchTerm}) async {
    emit(SearchLoading());

    final response = await searchRepo.search(
        userId: await SharedPrefHelper.getInt(SharedPrefKeys.userId),
        searchTerm: searchTerm);
    response.fold((failure) {
      emit(SearchError(message: failure.errorMessage));
    }, (responseBody) {
      emit(SearchLoaded(products: responseBody.data ?? []));
    });
  }
}
