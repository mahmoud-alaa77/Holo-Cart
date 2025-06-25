import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

class PayMethodItem extends StatelessWidget {
  final String assetsName;

  const PayMethodItem({super.key, required this.assetsName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45.h,
          width: 90.w,
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.customLightGrayColor.withAlpha(100),
                blurRadius: 4,
                spreadRadius: 1,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Image.asset(
            assetsName,
            
          ),
        ),
      ],
    );
  }
}
