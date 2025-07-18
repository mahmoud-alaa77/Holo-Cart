
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/features/forget_password/ui/widgets/bloc_listener_forget_password.dart';
import 'package:holo_cart/features/sign_up/logic/cubit/sign_up_cubit.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpSuccess || current is SignUpLoading   || current is SignUpFailure,
      listener: (context, state) {
        if (state is SignUpLoading) {
          showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color:AppColors .customBlueColor,
                ),
              ),
            );
        } else if (state is SignUpSuccess) {
          context.pop();
          showSuccessDialog(context);
        } else if (state is SignUpFailure) {
          context.pop();
          setupErrorState(context, state.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                context.pushReplacement(AppRoutes.main);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

}