import 'package:bloc/bloc.dart';
import 'package:holo_cart/features/forget_password/data/models/forget_password_request.dart';
import 'package:holo_cart/features/forget_password/data/models/forget_password_response.dart';
import 'package:holo_cart/features/forget_password/data/repo/forget_password_repo.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPasswordRepo) : super(ForgetPasswordInitial());
  final ForgetPasswordRepo _forgetPasswordRepo;
  Future<void> sendResetPasswordCode(ForgetPasswordRequest email) async {
    emit(ForgetPasswordLoading());
    final response = await _forgetPasswordRepo.forgetPassword(email);
    response.fold(
      (failure) => emit(ForgetPasswordError(failure.errorMessage)),
      (success) => emit(ForgetPasswordSuccess(success)),
    );
  }

}
