import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/auth_backround.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/forget_password/data/models/forget_password_request.dart';
import 'package:holo_cart/features/forget_password/data/models/verify/verification_requst.dart';
import 'package:holo_cart/features/forget_password/logic/forget_password/forget_password_cubit.dart';
import 'package:holo_cart/features/forget_password/logic/verify/verification_code_cubit.dart';
import 'package:holo_cart/features/forget_password/ui/widgets/verify_bloc_listener.dart';
import 'package:holo_cart/features/login/ui/widgets/back_item.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationCodeScreen extends StatelessWidget {
  final String email;
  const VerificationCodeScreen({super.key, required this.email});

  void _verifyCode(BuildContext context, String code) {
    if (code.length == 6) {
      context.read<VerificationCodeCubit>().sendResetPasswordCode(
            VerificationRequst(code: code, email: email),
          );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid 6-digit code"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _resendCode(BuildContext context) {
    context.read<ForgetPasswordCubit>().sendResetPasswordCode(
          ForgetPasswordRequest(email: email),
        );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Verification code has been resent to your email"),
        backgroundColor: AppColors.customBlueColor,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String code = "";

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
              const AuthBackGround(),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Align(
                              alignment: Alignment.topLeft, child: BackItem()),
                          verticalSpace(5),
                          Image.asset(
                            "assets/images/verify.png",
                            height: 0.27.sh,
                          ),
                          verticalSpace(5),
                          Text("Verification code",
                              style: AppTextStyles.font36W500),
                          Text(
                            "Please confirm the security code sent to your email.",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.font14W500.copyWith(
                              color: AppColors.customWhiteColor,
                            ),
                          ),
                          verticalSpace(20),
                          OtpTextField(
                            numberOfFields: 6,
                            borderColor: Colors.black,
                            filled: true,
                            showFieldAsBox: true,
                            onSubmit: (value) {
                              code = value;
                              _verifyCode(context, code);
                            },
                          ),
                          verticalSpace(30),
                          ButtonItem(
                            text: "Continue",
                            onPressed: () => _verifyCode(context, code),
                          ),
                          verticalSpace(10),
                          TextButton(
                            onPressed: () => _resendCode(context),
                            child: Text(
                              "Send Again",
                              style: AppTextStyles.font16W400.copyWith(
                                color: AppColors.customBlueColor,
                              ),
                            ),
                          ),
                          BlocListenerVerification(email: email),
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
}
