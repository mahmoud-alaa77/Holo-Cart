import 'package:bloc/bloc.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/features/favourites/data/models/add_or_delete_fav_body.dart';
import 'package:holo_cart/features/favourites/data/models/get_favourites_model.dart';
import 'package:holo_cart/features/favourites/data/repo/favourite_repo.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final FavouriteRepo favRepo;
  FavouriteCubit(this.favRepo) : super(FavouriteInitial());

  getAllFavouriteProducts() async {
    emit(FavouriteLoading());
    final result = await favRepo.getAllFavouriteProducts(
        id: await SharedPrefHelper.getInt(SharedPrefKeys.userId));
    result.fold((error) {
      emit(FavouriteError(error.errorMessage));
    }, (favModel) {
      emit(FavouriteLoaded(favModel));
    });
  }

  addProductToFavorite({required AddOrDeleteFavBody body}) async {
    await favRepo.addFavouriteProducts(body: body);
    emit(AddFavouriteSuccess("Product added to favourites"));
  }

  deleteProductToFavorite({required AddOrDeleteFavBody body}) async {
    await favRepo.deleteFavouriteProducts(body: body);
    emit(AddFavouriteSuccess("Product removed from favourites"));
    getAllFavouriteProducts();
  }
}
