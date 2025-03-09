import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

class CustomHomeDividerContainer extends StatelessWidget {
  const CustomHomeDividerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColors.customWhiteColor
          : AppColors.customLightBlakColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 22.5.h,
            decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.lightBackgroundColor
                    : AppColors.darkBackgroundColor,
                borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(20.r),
                    bottomStart: Radius.circular(20.r))),
          ),
          verticalSpace(15),
          Container(
            width: double.infinity,
            height: 22.5.h,
            decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.lightBackgroundColor
                    : AppColors.darkBackgroundColor,
                borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(20.r),
                    topStart: Radius.circular(20.r))),
          ),
        ],
      ),
    );
  }
}
