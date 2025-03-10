import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class EditProfileContainer extends StatelessWidget {
  const EditProfileContainer({
    super.key,
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
                Text(
                  "Mahmoud Alaa",
                  style: AppTextStyles.font18W600,
                ),
                verticalSpace(3),
                Text(
                  "mahmoudalaa1212.com",
                  style: AppTextStyles.font16W500,
                ),
                verticalSpace(3),
                Text(
                  "+201001235465",
                  style: AppTextStyles.font16W500,
                ),
              ],
            ),
            const Spacer(),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Edit",
                  style: AppTextStyles.font16W500.copyWith(
                      color: AppColors.customRedColor,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ));
  }
}
