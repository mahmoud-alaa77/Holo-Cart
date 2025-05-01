part of 'verification_code_cubit.dart';

@immutable
sealed class VerificationCodeState {}

final class VerificationCodeInitial extends VerificationCodeState {}
final class VerificationCodeLoading extends VerificationCodeState {}
final class VerificationCodeSuccess extends VerificationCodeState {
 final ForgetPasswordRespnse forgetPasswordRespnse;
  VerificationCodeSuccess({
    required this.forgetPasswordRespnse,
  });

  
}
final class VerificationCodeError extends VerificationCodeState {
  final String errorMessage;

  VerificationCodeError({required this.errorMessage});
}
