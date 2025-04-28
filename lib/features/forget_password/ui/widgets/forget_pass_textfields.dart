import 'package:flutter/material.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/auth_textfield.dart';

import '../../../../core/themes/app_colors.dart';

class ForgetPassTextfields extends StatelessWidget {
  const ForgetPassTextfields({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/forget_pass.png",height:  screenHeight*0.3),
        verticalSpace(5),
        Text("Forget Password",
            style: AppTextStyles.font36W500),
        Text(
            "We send you a code to the Email you Enter to Reset password",
            textAlign: TextAlign.center,
            style: AppTextStyles.font14W500.copyWith(
              color: AppColors.customWhiteColor,
            )),
        verticalSpace(15),
        const AuthTextfield(hintText: "Enter Email Address"),
        verticalSpace(20),
       
      ],
    );
  }
}
