part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}
final class ResetPasswordLoading extends ResetPasswordState {}
final class ResetPasswordSuccess extends ResetPasswordState {
  final ForgetPasswordRespnse response;
  ResetPasswordSuccess(this.response);
}
final class ResetPasswordError extends ResetPasswordState {
  final String error;
  ResetPasswordError(this.error);
}
