import 'package:flutter/material.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class TotalPayment extends StatelessWidget {
  const TotalPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Subtotal",
            style: AppTextStyles.font16W500,
          ),
          Text(
            "\$999",
            style: AppTextStyles.font16W400
                .copyWith(color: AppColors.customLightGrayColor),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Delivery fee",
            style: AppTextStyles.font16W500,
          ),
          Text(
            "\$99",
            style: AppTextStyles.font16W400
                .copyWith(color: AppColors.customLightGrayColor),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total",
            style: AppTextStyles.font16W500,
          ),
          Text(
            "\$1098",
            style: AppTextStyles.font16W400
                .copyWith(color: AppColors.customLightGrayColor),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total payment",
            style: AppTextStyles.font16W500,
          ),
          Text(
            "\$1098",
            style: AppTextStyles.font16W400
                .copyWith(color: AppColors.customLightGrayColor),
          )
        ],
      )
    ]);
  }
}
