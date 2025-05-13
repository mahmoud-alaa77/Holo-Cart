part of 'update_profile_cubit.dart';

@immutable
sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}
final class UpdateProfileLoading extends UpdateProfileState {}
final class UpdateProfileSuccess extends UpdateProfileState {
  
}
final class UpdateProfileFailure extends UpdateProfileState {
  final String errorMessage;

  UpdateProfileFailure(this.errorMessage);
}
