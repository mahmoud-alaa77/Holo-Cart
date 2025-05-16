import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/button_item.dart';

class BagAndButton extends StatelessWidget {
  const BagAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/parcel.png", width: 150.w, height: 150.h),
        Text("Your Cart is empty", style: AppTextStyles.font24W500),
        verticalSpace(10),
        SizedBox(
          width: 200.w,
          child: ButtonItem(
              text: "Explore products",
              radius: 30.sp,
              color: AppColors.primaryOrangeColor,
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.main);
              }),
        )
      ],
    );
  }
}
