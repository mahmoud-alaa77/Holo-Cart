part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
final class SignUpLoading extends SignUpState {}
final class SignUpSuccess extends SignUpState {
  final ApiResponse apiResponse;

  SignUpSuccess(this.apiResponse);
}
final class SignUpFailure extends SignUpState {
  final String errorMessage;

  SignUpFailure(this.errorMessage);
}
