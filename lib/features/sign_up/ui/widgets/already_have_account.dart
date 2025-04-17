import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: AppTextStyles.font13W400.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.customBlackColor
                  : AppColors.customWhiteColor),
        ),
        GestureDetector(
          onTap: () {
            context.go(AppRoutes.login);
          },
          child: Text(
            " login ",
            style: AppTextStyles.font13W500
                .copyWith(color: AppColors.customBlueColor),
          ),
        )
      ],
    );
  }
}
