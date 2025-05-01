import 'package:bloc/bloc.dart';
import 'package:holo_cart/features/forget_password/data/models/forget_password_response.dart';
import 'package:holo_cart/features/forget_password/data/models/verify/verification_requst.dart';
import 'package:holo_cart/features/forget_password/data/repo/verification_repo.dart';
import 'package:meta/meta.dart';

part 'verification_code_state.dart';

class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  VerificationCodeCubit(this._verificationRepo) : super(VerificationCodeInitial());
  final VerificationRepo _verificationRepo ;
  Future<void> sendResetPasswordCode(VerificationRequst verificationRequst) async {
    emit(VerificationCodeLoading());
    final response = await _verificationRepo.sendResetPasswordCode(verificationRequst);
    response.fold(
      (failure) => emit(VerificationCodeError(errorMessage: failure.errorMessage)),
      (success) => emit(VerificationCodeSuccess(forgetPasswordRespnse: success)),
    );
  }
      
}
