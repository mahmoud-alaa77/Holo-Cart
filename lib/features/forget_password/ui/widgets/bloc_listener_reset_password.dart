import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/features/forget_password/logic/reset_password/reset_password_cubit.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/themes/app_text_styles.dart';

class BlocListenerResetPassword extends StatelessWidget {
  const BlocListenerResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listenWhen: (previous, current) =>
          current is ResetPasswordLoading ||
          current is ResetPasswordSuccess ||
          current is ResetPasswordError,
      listener: (context, state) {
        debugPrint("LoginBlocListener State: $state");

        if (state is ResetPasswordLoading) {
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

        if (state is ResetPasswordSuccess) {
          context.push(
            AppRoutes.login,
          );
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Password reset successfully"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ));
        } else if (state is ResetPasswordError) {
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
