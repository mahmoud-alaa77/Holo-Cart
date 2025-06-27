import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/auth_backround.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/login/ui/widgets/back_item.dart';
import 'package:holo_cart/features/sign_up/data/model/sign_up_request.dart';
import 'package:holo_cart/features/sign_up/logic/cubit/sign_up_cubit.dart';

import 'package:holo_cart/features/sign_up/ui/widgets/already_have_account.dart';
import 'package:holo_cart/features/sign_up/ui/widgets/others_sign_up.dart';
import 'package:holo_cart/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:holo_cart/features/sign_up/ui/widgets/sign_up_face_google.dart';
import 'package:holo_cart/features/sign_up/ui/widgets/text_fields_sign_up.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
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
          ),
          const AuthBackGround(),
          Positioned(
            top: 45.h,
            child: Container(
              width: screenWidth,
              height: screenHeight,
              decoration: const BoxDecoration(
                color: AppColors.primaryOrangeColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BackItem(),
                      Center(
                        child: Text("Hello in ,Sign Up \nPage.",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.font28W500.copyWith(
                              color: AppColors.customBlackColor,
                            )),
                      ),
                      const TextFieldsSignUp(),
                      verticalSpace(22),
                      ButtonItem(
                          text: "Sign Up",
                          onPressed: () {
                            validateThenDoSignUp(context);
                          }),
                      SizedBox(
                        height: 26.h,
                      ),
                      const OthersSignUp(),
                      const SignUpWithFaceOrGoogle(),
                      verticalSpace(20),
                      const AlreadyHaveAccount(),
                      const SignupBlocListener(),
                      verticalSpace(20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void validateThenDoSignUp(BuildContext context) {
  if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
    context.read<SignUpCubit>().emitStates(SignUpRequestBody(
          fullName: context.read<SignUpCubit>().fullName.text,
          userName: context.read<SignUpCubit>().userName.text,
          email: context.read<SignUpCubit>().emailController.text,
          phoneNumber: context.read<SignUpCubit>().phoneNumber.text,
          password: context.read<SignUpCubit>().passwordController.text,
          confirmPassword:
              context.read<SignUpCubit>().passwordConfirmationController.text,
        ));
  }
}
