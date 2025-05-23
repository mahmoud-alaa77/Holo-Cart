part of 'favourite_cubit.dart';

sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteLoaded extends FavouriteState {
  final GetFavouriteModel favouriteItems;
  FavouriteLoaded(this.favouriteItems);
}

final class FavouriteError extends FavouriteState {
  final String message;
  FavouriteError(this.message);
}

final class FavouriteLoading extends FavouriteState {}


final class AddFavouriteSuccess extends FavouriteState {
  final String message;
  AddFavouriteSuccess(this.message);
}

final class DeleteFavouriteSuccess extends FavouriteState {
  final String message;
  DeleteFavouriteSuccess(this.message);
}
