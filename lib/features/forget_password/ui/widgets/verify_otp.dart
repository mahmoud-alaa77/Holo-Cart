import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/button_item.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({
    super.key,
    required this.screenHeight,
    required int start,
  }) : _start = start;

  final double screenHeight;
  final int _start;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/reset.png",
          height: screenHeight * 0.3,
        ),
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
        Text('00:$_start ', style: AppTextStyles.font16W600),
    
        verticalSpace(4),
        OtpTextField(
          numberOfFields: 6,
          borderColor: Color.fromARGB(255, 167, 13, 13),
          focusedBorderColor:
              Color.fromARGB(255, 255, 255, 255),
          fillColor: Colors.white,
          filled: true,
          showFieldAsBox: true,
          borderWidth: 2.0,
          borderRadius: BorderRadius.circular(12),
          fieldWidth: 40.w,
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
        Text("Did not receive the code?",
            style: AppTextStyles.font16W400),
        
      ],
    );
  }
}
