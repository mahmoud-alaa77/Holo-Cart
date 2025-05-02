
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/forget_password/logic/verify/verification_code_cubit.dart';

class BlocListenerVerification extends StatelessWidget {
  final String email;
  const BlocListenerVerification({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCodeCubit, VerificationCodeState>(
      listenWhen: (previous, current) =>
          current is VerificationCodeLoading ||
          current is VerificationCodeSuccess ||
          current is VerificationCodeError,
      listener: (context, state) {
        if (state is VerificationCodeLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else {
          Navigator.of(context, rootNavigator: true).pop();
        }

        if (state is VerificationCodeSuccess) {
          context.push(AppRoutes.resetPassword, extra: email); // ✅ الإيميل الممرر
        } else if (state is VerificationCodeError) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              icon: const Icon(Icons.error, color: Colors.red, size: 32),
              content: Text(state.errorMessage,
                  style: AppTextStyles.font14W500.copyWith(color: Colors.red)),
              actions: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: Text('Got it',
                      style: AppTextStyles.font14W500
                          .copyWith(color: Colors.red)),
                )
              ],
            ),
          );
        }
      },
      child: const SizedBox(),
    );
  }
}

