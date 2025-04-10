import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

class PayMethodItem extends StatelessWidget {
  const PayMethodItem({super.key, required this.assetsName});
  final String assetsName ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 8.w),
      child: Container(
        height: 40.h,
        width: 90.w   ,   decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.customLightGrayColor.withAlpha( 100),
              spreadRadius: 1,
              blurRadius: 0,
             
            ),
            
          ],
        ),
        child: Image.asset(assetsName),
      ),
    );
  }
}