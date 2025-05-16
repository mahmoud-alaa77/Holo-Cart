import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class EditProfileContainer extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  const EditProfileContainer({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(12.r),
      width: MediaQuery.sizeOf(context).width - 40.w,
      decoration: BoxDecoration(
        color: AppColors.customLightGrayColor.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AppTextStyles.font18W600),
              verticalSpace(3),
              Text(email, style: AppTextStyles.font16W500),
              verticalSpace(3),
              Text(phone, style: AppTextStyles.font16W500),
            ],
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.UpdateUserProfile);
            },
            child: Text(
              "Edit",
              style: AppTextStyles.font16W500.copyWith(
                color: AppColors.customRedColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
