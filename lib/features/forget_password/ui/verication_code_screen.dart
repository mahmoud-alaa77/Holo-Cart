import 'dart:async'; // عشان نستخدم Timer
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/auth_backround.dart';
import 'package:holo_cart/features/forget_password/data/models/forget_password_request.dart';
import 'package:holo_cart/features/forget_password/logic/forget_password/forget_password_cubit.dart';
import 'package:holo_cart/features/forget_password/ui/widgets/verify_otp.dart';
import 'package:holo_cart/features/login/ui/widgets/back_item.dart';

class VericationCodeScreen extends StatefulWidget {
  final String email;

  const VericationCodeScreen({super.key, required this.email});

  @override
  State<VericationCodeScreen> createState() => _VericationCodeScreenState();
}

class _VericationCodeScreenState extends State<VericationCodeScreen> {
  late Timer _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    startTimer(); 
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
    _timer.cancel(); 
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
                    VerifyOtp(screenHeight: screenHeight, start: _start),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                            onPressed: () {
                              context
                                  .read<ForgetPasswordCubit>()
                                  .sendResetPasswordCode(
                                    ForgetPasswordRequest(email: widget.email),
                                  );
                      
                              ScaffoldMessenger.of(context).showSnackBar(
                             const   SnackBar(
                                  content: Text(
                                      "Verification code has been resent to your email"),
                                  backgroundColor: AppColors.customBlueColor,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: Text(
                              "Send Again",
                              style: AppTextStyles.font16W400.copyWith(
                                color: AppColors.customBlueColor,
                              ),
                            ),
                          ),
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

