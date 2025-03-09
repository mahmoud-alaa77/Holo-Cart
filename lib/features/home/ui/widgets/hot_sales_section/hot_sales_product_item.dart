import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/custom_rating_widget.dart';

class HotSalesProductItem extends StatelessWidget {
  const HotSalesProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 8.r, vertical: 4.r),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withValues(alpha: .5),
              offset: const Offset(0, 2),
              blurRadius: 2)
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      width: MediaQuery.sizeOf(context).width / 2.2,
      height: 235.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
              child: Image.asset(
                "assets/images/product.png",
                height: 120.h,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          verticalSpace(6),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 6.r),
            child: Text(
              "feature table",
              style: AppTextStyles.font18W500,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          verticalSpace(2),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 6.r),
            child: Text(
              "Table for Sofa and Bed, Durable Metal and Exquisite Wooden S...",
              style: AppTextStyles.font14W500,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          verticalSpace(3),
          Row(
            children: [
              horizontalSpace(8),
              Text(
                "9\$",
                style: AppTextStyles.font16W500,
              ),
              horizontalSpace(8),
              Text(
                "16\$",
                style: AppTextStyles.font16W500
                    .copyWith(color: AppColors.customLightGrayColor)
                    .copyWith(decoration: TextDecoration.lineThrough),
              ),
              const Spacer(),
              Text(
                "30% OFF",
                style: AppTextStyles.font15W400
                    .copyWith(color: AppColors.primaryOrangeColor),
              ),
              horizontalSpace(8)
            ],
          ),
          verticalSpace(6),
          const CustomRatingWidget(),
        ],
      ),
    );
  }
}
