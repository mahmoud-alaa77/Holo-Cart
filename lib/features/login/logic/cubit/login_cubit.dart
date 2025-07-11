import 'dart:convert';
import 'dart:developer';

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
  final LoginRepo loginRepo;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  int currentUserId = 0;

  Future<void> emitStateLogin(LoginRequestBody loginRequestBody) async {
    emit(LoginLoading());

    final result = await loginRepo.login(loginRequestBody);
    result.fold(
      (failure) => emit(LoginFailure(failure.errorMessage)),
      (loginResponse) {
        saveUserToken(loginResponse.userData!.accessToken ?? "");

        emit(LoginSuccess(loginResponse));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.token, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);

    // ✅ استخراج الـ id من الـ token وتخزينه
    final decoded = parseJwt(token);
    final userId = decoded['Id'];
    await SharedPrefHelper.saveDataByKey(
        SharedPrefKeys.userId, int.parse(userId));
    currentUserId = int.parse(userId);
    int id = await SharedPrefHelper.getInt(SharedPrefKeys.userId);
    log("currentUserId =====> $id");
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) throw Exception('Invalid token');
    final payload = parts[1];
    final normalized = base64Url.normalize(payload);
    final decoded = utf8.decode(base64Url.decode(normalized));
    return json.decode(decoded);
  }
}
