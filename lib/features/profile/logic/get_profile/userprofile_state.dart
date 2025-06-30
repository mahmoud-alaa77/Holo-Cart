part of 'userprofile_cubit.dart';

@immutable
sealed class UserprofileState {}

final class UserprofileInitial extends UserprofileState {}
final class UserprofileLoading extends UserprofileState {}
class UserprofileLoaded extends UserprofileState {
  final UserProfileModel user;

  UserprofileLoaded(this.user);
}
final class UserprofileError extends UserprofileState {
  final String error;

  UserprofileError(this.error);
}

final class GuestProfileState extends UserprofileState {}
