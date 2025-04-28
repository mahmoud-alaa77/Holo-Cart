import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class PhotoProductDetails extends StatelessWidget {
  final String? image;
  const PhotoProductDetails({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.customBlackColor.withValues(alpha: .5)
              : AppColors.customWhiteColor,
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
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
          Stack(children: [
            Image.network(
              image!,
              height: 300.h,
              width: double.infinity,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
            Positioned(
              top: 16.h,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(right: 18.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.language,
                      size: 30.r,
                    )
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
