import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:holo_cart/features/sign_up/data/model/sign_up_request.dart';
import 'package:holo_cart/features/sign_up/data/model/sign_up_response.dart';

import '../../data/repo/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  final SignUpRepo signUpRepo;
  TextEditingController userName = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =TextEditingController();
  TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();


      
  final formKey = GlobalKey<FormState>();

  Future<void> emitStates(SignUpRequestBody signUpRequestBody) async {
    emit(SignUpLoading());
    final result = await signUpRepo.signUp(signUpRequestBody);
    result.fold(
      (failure) => emit(SignUpFailure(failure.errorMessage)),
      (signUpResponse) => emit(SignUpSuccess(signUpResponse)),
    );
  }
}
