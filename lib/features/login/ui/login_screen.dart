import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/login/data/models/login_request_body.dart';
import 'package:holo_cart/features/login/logic/cubit/login_cubit.dart';
import 'package:holo_cart/features/login/ui/widgets/email_and_password.dart';
import 'package:holo_cart/features/login/ui/widgets/login__bloc_listener.dart';
import 'package:holo_cart/core/widgets/auth_backround.dart';
import 'package:holo_cart/features/login/ui/widgets/login_face_google.dart';
import 'package:holo_cart/features/login/ui/widgets/not_have_account.dart';
import 'package:holo_cart/features/login/ui/widgets/other_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            top: 80.h,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const BackItem(),
                    Center(
                      child: Text("Hello in ,Login \nPage.",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.font28W500.copyWith(
                            color: AppColors.customBlackColor,
                          )),
                    ),
                    const EmailAndPassword(),
                    GestureDetector(
                      onTap: () =>
                          GoRouter.of(context).push(AppRoutes.forgetPassword),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Forget Password?",
                              textAlign: TextAlign.end,
                              style: AppTextStyles.font13W400.copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.customBlackColor
                                      : AppColors.customWhiteColor)),
                        ],
                      ),
                    ),

                    verticalSpace(22),
                    ButtonItem(
                        text: "Login",
                        onPressed: () {
                          validateThenDoLogin(context);
                        }),
                    const LoginBlocListner(),
                    SizedBox(
                      height: 26.h,
                    ),
                    const OthersLogin(),
                    const LoginWithFaceOrGoogle(),
                    verticalSpace(20),
                    const NotHaveAccount(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void validateThenDoLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    context.read<LoginCubit>().emitStateLogin(
          LoginRequestBody(
            identifier: context.read<LoginCubit>().userNameController.text,
            password: context.read<LoginCubit>().passwordController.text,
          ),
        );
  }
}
