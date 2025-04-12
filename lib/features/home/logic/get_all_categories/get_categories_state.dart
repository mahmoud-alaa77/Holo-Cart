part of 'get_categories_cubit.dart';

sealed class GetCategoriesState {}

final class GetCategoriesInitial extends GetCategoriesState {}

final class GetCategoriesLoading extends GetCategoriesState {}

final class GetCategoriesSuccess extends GetCategoriesState {
  final CategoryModel categoryModel;

  GetCategoriesSuccess(this.categoryModel);
}

final class GetCategoriesError extends GetCategoriesState {
  final String errorMessage;
  GetCategoriesError(this.errorMessage);
}
