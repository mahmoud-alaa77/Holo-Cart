import 'dart:async'; // عشان نستخدم Timer
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/auth_backround.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/login/ui/widgets/back_item.dart';

class VericationCodeScreen extends StatefulWidget {
  const VericationCodeScreen({super.key});

  @override
  State<VericationCodeScreen> createState() => _VericationCodeScreenState();
}

class _VericationCodeScreenState extends State<VericationCodeScreen> {
  late Timer _timer;
  int _start = 60; // مدة التايمر 60 ثانية

  @override
  void initState() {
    super.initState();
    startTimer(); // نبدأ التايمر أول ما تفتح الشاشة
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        _timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // نلغي التايمر لما نخرج من الشاشة عشان ما يصير مشاكل
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true, 
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
          const AuthBackround(),
          Positioned(
            top: 100.h,
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
                    Column(
                      children: [
                        Image.asset("assets/images/reset.png",height: screenHeight*0.3, ),
                        verticalSpace(5),
                        Text(
                          "Verification code",
                          style: AppTextStyles.font36W500,
                        ),
                        Text(
                          "Please confirm the security code received on your registered email.",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.font14W500.copyWith(
                            color: AppColors.customWhiteColor,
                          ),
                        ),
                        verticalSpace(15),
                        
                        // هنا بنعرض التايمر
                        Text(
                          '00:$_start ',
                          style: AppTextStyles.font16W600
                        ),
              
                        verticalSpace(4),
                        OtpTextField(
                          numberOfFields: 4,
                          borderColor: Color.fromARGB(255, 167, 13, 13),
                          focusedBorderColor: Color.fromARGB(255, 255, 255, 255),
                          fillColor: Colors.white,
                          filled: true,
                          showFieldAsBox: true,
                          borderWidth: 2.0,
                          borderRadius: BorderRadius.circular(12),
                          fieldWidth: 60,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          cursorColor: Colors.blue,
                          enabledBorderColor: Colors.black,
                          disabledBorderColor: Colors.grey,
                          autoFocus: false,
                          keyboardType: TextInputType.number,
                          clearText: true,
                          onCodeChanged: (String code) {},
                          onSubmit: (String code) {},
                        ),
                        verticalSpace(20),
                        ButtonItem(
                          text: "Continue",
                          onPressed: () {
                            GoRouter.of(context).push(AppRoutes.resetPassword);
                          },
                        ),
                        Text(
                          "Did not receive the code?",
                          style: AppTextStyles.font16W400
                        ), 
                        Text(
                          "Send Again",
                          style: AppTextStyles.font16W400.copyWith(
                            color: AppColors.customBlueColor
                          )
                        ),
                        
                      ],
                    ),
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
