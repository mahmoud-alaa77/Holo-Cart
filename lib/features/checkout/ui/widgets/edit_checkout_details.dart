import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class EditCheckoutDetails extends StatelessWidget {
  const EditCheckoutDetails(
      {super.key, required this.title, required this.subtitle, required this.location});
  final String title;
  final String subtitle;
  final String location;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        GoRouter.of(context).push(location);
      } ,
      child: Container(
        height: 70.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: AppColors.customLightColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.font13W500,
                    ),
                    Text(
                      subtitle,
                      style: AppTextStyles.font15W500,
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.primaryOrangeColor,
                  ),
                  iconSize: 24.sp,
                ),
              ),
            ]),
      ),
    );
  }
}
