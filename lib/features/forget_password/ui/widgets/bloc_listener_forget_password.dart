import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/forget_password/logic/forget_password/forget_password_cubit.dart';

class BlocListenerForgetPassword extends StatelessWidget {
  const BlocListenerForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listenWhen: (previous, current) =>
          current is ForgetPasswordLoading ||
          current is ForgetPasswordSuccess ||
          current is ForgetPasswordError,
      listener: (context, state) {
        debugPrint("LoginBlocListener State: $state");

        if (state is ForgetPasswordLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          Navigator.of(context, rootNavigator: true).pop();
        }

        if (state is ForgetPasswordSuccess) {
          context.push(AppRoutes.verificationCode,
              extra: context.read<ForgetPasswordCubit>().emailController.text);
        } else if (state is ForgetPasswordError) {
          setupErrorState(context, state.error);
          debugPrint(" ${state.error}");
        }
      },
      child: const SizedBox(),
    );
  }
}

void setupErrorState(BuildContext context, String errorMessage) {
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
