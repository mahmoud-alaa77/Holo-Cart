import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/login/ui/widgets/back_item.dart';
import 'package:holo_cart/features/login/ui/widgets/email_and_password.dart';
import 'package:holo_cart/features/login/ui/widgets/login_face_google.dart';
import 'package:holo_cart/features/login/ui/widgets/other_login.dart';

import 'widgets/already_have_account.dart';

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
          Positioned(
            left: screenWidth * 0,
            top: screenHeight * 0,
            child: Image.asset(
              "assets/images/Rectangle3.png",
              height: screenHeight * 0.15,
              width: screenWidth * 0.2,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: screenWidth * 0.23,
            top: screenHeight * 0.0,
            child: Image.asset(
              "assets/images/Rectangle13.png",
              height: screenHeight * 0.2,
              width: screenWidth * 0.55,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: screenWidth * 0,
            top: screenHeight * 0,
            child: Image.asset(
              "assets/images/Rectangle6.png",
              height: screenHeight * 0.15,
              width: screenWidth * 0.2,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 0,
            top: screenHeight * 0.16,
            child: Image.asset(
              "assets/images/Rectangle1.png",
              width: screenWidth * 0.2,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: screenWidth * 0,
            top: screenHeight * 0.16,
            child: Image.asset(
              "assets/images/Rectangle4.png",
              width: screenWidth * 0.2,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 130.h,
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
                    const BackItem(),
                    Center(
                      child: Text("Hello in ,Login \nPage.",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.font28W500.copyWith(
                            color: AppColors.customBlackColor,
                          )),
                    ),
                    const EmailAndPassword(),
                    Row(
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
                    verticalSpace(22),
                    ButtonItem(text: "Login", onPressed: () {}),
                    SizedBox(
                      height: 26.h,
                    ),
                    const OthersLogin(),
                    const LoginWithFaceOrGoogle(),
                    verticalSpace(20),
                    const AlreadyHaveAccount(),
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
