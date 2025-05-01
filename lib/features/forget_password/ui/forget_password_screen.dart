import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/widgets/auth_backround.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/forget_password/data/models/forget_password_request.dart';
import 'package:holo_cart/features/forget_password/logic/forget_password/forget_password_cubit.dart';
import 'package:holo_cart/features/forget_password/ui/widgets/bloc_listener_forget_password.dart';
import 'package:holo_cart/features/forget_password/ui/widgets/forget_pass_textfields.dart';
import 'package:holo_cart/features/login/ui/widgets/back_item.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Space for AuthBackground
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryOrangeColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const BackItem(),
                              const ForgetPassTextfields(),
                              ButtonItem(
                                text: "Continue",
                                onPressed: () {
                                  validateThenDoLogin(context);
                                },
                              ),
                              const BlocListenerForgetPassword(),
                             
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void validateThenDoLogin(BuildContext context) {
  if (context.read<ForgetPasswordCubit>().formKey.currentState!.validate()) {
    context.read<ForgetPasswordCubit>().sendResetPasswordCode(
      ForgetPasswordRequest(
        email: context.read<ForgetPasswordCubit>().emailController.text,
      ),
    );
  }
}