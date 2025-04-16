
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/login/logic/cubit/login_cubit.dart';

class LoginBlocListner extends StatelessWidget {
  const LoginBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading || current is LoginSuccess || current is LoginFailure,
      listener: (context, state) {
        debugPrint("LoginBlocListener State: $state");

        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LoginSuccess) {
          context.pop();
          context.go('/main');
        } else if (state is LoginFailure) {
          context.pop();
          setupErrorState(context, state.errorMessage);
        }
      },
      child: const SizedBox(),
    );
  }
}

void setupErrorState(BuildContext context,   String errorMessage) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        errorMessage,
        style: AppTextStyles.font14W500.copyWith(
          color: Colors.red,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: AppTextStyles.font14W500.copyWith(
              color: Colors.red,
            ),
          ),
        ),
      ],
    ),
  );
}
