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

  List<int> favProductIds = [];

  getAllFavouriteProducts() async {
    emit(FavouriteLoading());
    final result = await favRepo.getAllFavouriteProducts(
      id: await SharedPrefHelper.getInt(SharedPrefKeys.userId),
    );
    result.fold((error) {
      emit(FavouriteError(error.errorMessage));
    }, (favModel) {
      favProductIds =
          favModel.favouriteDataList!.map((e) => e.productId!).toList();
      emit(FavouriteLoaded(favModel));
    });
  }

  addProductToFavorite({required AddOrDeleteFavBody body}) async {
    await favRepo.addFavouriteProducts(body: body);

    favProductIds = List.from(favProductIds)..add(body.productId);
    emit(FavouriteUpdated(favProductIds));
  }

  deleteProductToFavorite({required AddOrDeleteFavBody body}) async {
    await favRepo.deleteFavouriteProducts(body: body);

    favProductIds = List.from(favProductIds)..remove(body.productId);
    emit(FavouriteUpdated(favProductIds));
  }

  deleteProductFromFavorite({required AddOrDeleteFavBody body}) async {
    await favRepo.deleteFavouriteProducts(body: body);

    favProductIds = List.from(favProductIds)..remove(body.productId);
    emit(FavouriteUpdated(favProductIds));
    getAllFavouriteProducts();
  }
}
