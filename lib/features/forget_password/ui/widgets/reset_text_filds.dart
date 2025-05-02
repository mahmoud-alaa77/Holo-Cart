import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/auth_textfield.dart';
import 'package:holo_cart/features/forget_password/logic/reset_password/reset_password_cubit.dart';

class ResetTextFields extends StatelessWidget {
  const ResetTextFields({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ResetPasswordCubit>().formKey,
      child: Column(
        children: [
          Image.asset("assets/images/reset.png", height: screenHeight * 0.3),
          verticalSpace(5),
          Text("Reset Password", style: AppTextStyles.font36W500),
          verticalSpace(10),
          AuthTextfield(
              validator: (data) {
                  if (data == null || data.isEmpty) {
                    return 'Please enter a valid password';
                  }
                  return null;
                },
            hintText: "Password",
            controller: context.read<ResetPasswordCubit>().password,
          ),
          verticalSpace(10),
           AuthTextfield(
              validator: (data) {
                  if (data == null || data.isEmpty) {
                    return 'Please enter a valid confirm password';
                  }
                  return null;
                },
            hintText: "Confirm Password",
             controller: context.read<ResetPasswordCubit>().confirmPassword,
            obscureText: true,
          ),
          verticalSpace(30),
        ],
      ),
    );
  }
}
