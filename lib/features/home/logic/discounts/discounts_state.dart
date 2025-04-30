part of 'discounts_cubit.dart';

sealed class DiscountsState {}

final class DiscountsInitial extends DiscountsState {}

final class DiscountsLoaded extends DiscountsState {
  final GetAllDiscountsModel discountsModel;
  DiscountsLoaded(this.discountsModel);
}

final class DiscountsError extends DiscountsState {
  final String error;
  DiscountsError(this.error);
}

final class DiscountsLoading extends DiscountsState {}
