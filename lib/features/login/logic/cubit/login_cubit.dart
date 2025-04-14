import 'package:bloc/bloc.dart';
import 'package:holo_cart/features/login/data/models/login_request_body.dart';
import 'package:holo_cart/features/login/data/models/login_response.dart';
import 'package:holo_cart/features/login/data/repo/login_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo ;
  void login(LoginRequestBody loginRequestBody) async {
    emit(LoginLoading());
    final result = await loginRepo.login(loginRequestBody);
    result.fold(
      (failure) => emit(LoginFailure(failure.errorMessage)),
      (loginResponse) => emit(LoginSuccess(loginResponse)),
    );
  }
}
