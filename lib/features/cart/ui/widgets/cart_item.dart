import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5.h,),
      decoration: BoxDecoration(
        color: AppColors.customLightColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Image.asset("assets/images/iphone.png", width: 70.w, height: 70.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Iphone 14 pro max", style: AppTextStyles.font14W600),
                  horizontalSpace(85),
                  Text(
                    "\$999",
                    style: AppTextStyles.font12W700,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "size: ",
                    style: AppTextStyles.font12W400,
                  ),
                  Text(
                    "125",
                    style: AppTextStyles.font12W700,
                  ),
                  horizontalSpace(20),
                  Text(
                    "color: ",
                    style: AppTextStyles.font12W400,
                  ),
                  Text(
                    "blue",
                    style: AppTextStyles.font12W700,
                  ),
                  horizontalSpace(50),
                  Container(
                    height: 22.h,
                    width: 22.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    
                    child: Center(
                      child: Text(
                        "+",
                        style: AppTextStyles.font12W700.copyWith(
                          color: AppColors.customRedColor,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    " 1 ",
                    style: AppTextStyles.font12W700,
                  ),
                  Container(
                    height: 25.h,
                    width: 25.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "-",
                        style: AppTextStyles.font12W700.copyWith(
                          color: AppColors.customRedColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
