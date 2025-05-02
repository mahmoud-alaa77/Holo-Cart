import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/widgets/auth_backround.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/forget_password/data/models/resetpassword/reset_password_request.dart';
import 'package:holo_cart/features/forget_password/logic/forget_password/forget_password_cubit.dart';
import 'package:holo_cart/features/forget_password/logic/reset_password/reset_password_cubit.dart';
import 'package:holo_cart/features/forget_password/ui/widgets/bloc_listener_reset_password.dart';
import 'package:holo_cart/features/forget_password/ui/widgets/reset_text_filds.dart';
import 'package:holo_cart/features/login/ui/widgets/back_item.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryOrangeColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.grey,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              const AuthBackround(),
              Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryOrangeColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BackItem(),
                          ResetTextFields(screenHeight: MediaQuery.of(context).size.height),
                          ButtonItem(
                            text: "Confirm",
                            onPressed: () {
                              validateThenDoLogin(context);
                             
                            },
                          ),
                        const  BlocListenerResetPassword()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void validateThenDoLogin(BuildContext context) {
  if (context.read<ResetPasswordCubit>().formKey.currentState!.validate()) {
    context.read<ResetPasswordCubit>().resetPassword(
          ResetPasswordRequest(
            email:email,
            confirmPassword: context.read<ResetPasswordCubit>().confirmPassword.text,
            password: context.read<ResetPasswordCubit>().password.text,
          ),
        );
  }
}

}
