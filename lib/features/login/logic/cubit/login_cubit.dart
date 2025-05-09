import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/core/networking/dio_factory.dart';
import 'package:holo_cart/features/login/data/models/login_request_body.dart';
import 'package:holo_cart/features/login/data/models/login_response.dart';
import 'package:holo_cart/features/login/data/repo/login_repo.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo ;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> emitStateLogin(LoginRequestBody loginRequestBody) async {
  emit(LoginLoading());
  
  
  final result = await loginRepo.login(loginRequestBody);
  result.fold(
    (failure) => emit(LoginFailure(failure.errorMessage)),
    (loginResponse) {
saveUserToken(loginResponse.userData!.accessToken??"");

      emit(LoginSuccess(loginResponse));
    },
  );
}
Future<void> saveUserToken(String token)async{
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.token, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
