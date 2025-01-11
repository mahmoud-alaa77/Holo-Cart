import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class OthersLogin extends StatelessWidget {
  const OthersLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.customBlackColor
                : AppColors.customWhiteColor,
          ),
        ),
        horizontalSpace(6),
        Text(
          'other login',
          style: AppTextStyles.font13W400.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.customBlackColor
                  : AppColors.customWhiteColor),
        ),
        horizontalSpace(4),
        Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.customBlackColor
                : AppColors.customWhiteColor,
          ),
        ),
      ],
    );
  }
}
