import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:holo_cart/features/forget_password/data/models/forget_password_response.dart';
import 'package:holo_cart/features/forget_password/data/models/resetpassword/reset_password_request.dart';
import 'package:holo_cart/features/forget_password/data/repo/reset_password_repo.dart';
part 'reset_password_state.dart';
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._resetPasswordRepo) : super(ResetPasswordInitial());
  final ResetPasswordRepo _resetPasswordRepo;
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  Future<void> resetPassword(ResetPasswordRequest resetPasswordRepo) async {
    emit(ResetPasswordLoading());
    final result =
        await _resetPasswordRepo.sendResetPasswordCode(resetPasswordRepo);
    result.fold(
      (error) => emit(ResetPasswordError(error.errorMessage)),
      (response) => emit(ResetPasswordSuccess(response)),
    );
  }
}
