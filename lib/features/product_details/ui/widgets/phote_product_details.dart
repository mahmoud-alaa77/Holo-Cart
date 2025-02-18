import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class PhotoProductDetails extends StatelessWidget {
  const PhotoProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.customWhiteColor,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(25.r), right: Radius.circular(25.r))),
      child: Column(
        children: [
          verticalSpace(40),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.customBlackColor,
                    size: 26.sp,
                  ),
                ),
               const Spacer(
                  flex: 2,
                ),
                Text(
                  "Product Detils",
                  style: AppTextStyles.font24W800,
                ),
             const   Spacer(
                  flex: 3,
                ),
              ],
            ),
            
          ),
         Padding(
           padding:  EdgeInsets.only(right: 18.w),
           child: const Row( crossAxisAlignment: CrossAxisAlignment.end,
           mainAxisAlignment: MainAxisAlignment.end,
            children: [
           
              Icon(
                Icons.language,size: 25,)
           
            ],),
         ),
          Image.asset("assets/images/iphone.png"
              ,),
        ],
      ),
    );
  }
}