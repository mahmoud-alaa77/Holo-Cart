part of 'seach_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<ProductData> products;
  SearchLoaded({required this.products});
}

final class SearchError extends SearchState {
  final String message;
  SearchError({required this.message});
}
