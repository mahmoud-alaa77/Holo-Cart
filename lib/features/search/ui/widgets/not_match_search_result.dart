import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:lottie/lottie.dart';

class NotMatchSearchResult extends StatelessWidget {
  const NotMatchSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          "assets/images/search.json",
          width: 200.w,
        ),
        verticalSpace(24),
        Text(
          "Sorry, we couldn't find any matching result for your Search.",
          style: AppTextStyles.font20W700,
          textAlign: TextAlign.center,
        ),
        verticalSpace(16),
        ButtonItem(
          color: AppColors.primaryOrangeColor,
          text: "Explore Products",
          radius: 16,
          width: MediaQuery.sizeOf(context).width - 100.w,
          buttonTextStyle:
              AppTextStyles.font18W500.copyWith(color: Colors.white),
          onPressed: () {
            context.pop();
          },
        ),
      ],
    );
  }
}
