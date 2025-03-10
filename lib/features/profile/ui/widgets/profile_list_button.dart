import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class ProfileListButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const ProfileListButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          padding: EdgeInsetsDirectional.all(12.r),
          margin: EdgeInsetsDirectional.symmetric(vertical: 8.r),
          width: MediaQuery.sizeOf(context).width - 40.w,
          decoration: BoxDecoration(
            color: AppColors.customLightGrayColor.withValues(alpha: .05),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Text(
                title,
                style: AppTextStyles.font18W500,
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_outlined)
            ],
          )),
    );
  }
}
