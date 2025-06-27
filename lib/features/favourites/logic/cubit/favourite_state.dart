
part of 'favourite_cubit.dart';

abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteLoaded extends FavouriteState {
  final GetFavouriteModel favouritesModel;

  FavouriteLoaded(this.favouritesModel);
}

class FavouriteError extends FavouriteState {
  final String message;

  FavouriteError(this.message);
}

class FavouriteUpdated extends FavouriteState {
  final List<int> favProductIds;

  FavouriteUpdated(this.favProductIds);
}

class AddFavouriteSuccess extends FavouriteState {
  final String message;

  AddFavouriteSuccess(this.message);
}
