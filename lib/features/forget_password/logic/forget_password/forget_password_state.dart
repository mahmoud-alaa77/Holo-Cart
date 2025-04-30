part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
final class ForgetPasswordLoading extends ForgetPasswordState {}
final class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordRespnse forgetPasswordRespnse;
  ForgetPasswordSuccess(this.forgetPasswordRespnse);
}
final class ForgetPasswordError extends ForgetPasswordState {
  final String error;
  ForgetPasswordError(this.error);
}
