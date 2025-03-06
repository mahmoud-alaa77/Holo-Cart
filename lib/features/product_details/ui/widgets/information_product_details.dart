import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/product_details/ui/widgets/product_colors_and_rating.dart';
import 'package:holo_cart/features/product_details/ui/widgets/silimilar_to_list_view.dart';
import 'package:readmore/readmore.dart';

class InformationProductDetails extends StatelessWidget {
  const InformationProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Container(
        decoration: BoxDecoration(
            color:Theme.of(context).brightness == Brightness.dark
                    ? AppColors.customBlackColor.withValues(alpha: .5)
                    :AppColors.customWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            )),
        child: Padding(
          padding: EdgeInsets.only(left: 15.0.w, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "iPhone 16 is built for Apple Intelligence ",
                      style: AppTextStyles.font22W700,
                    ),
                  ),
                  const Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.redAccent,
                  )
                ],
              ),
              verticalSpace(10),
              Row(
                children: [
                  Text(
                    "\$1200 ",
                    style: AppTextStyles.font20W700
                        .copyWith(color: AppColors.primaryOrangeColor),
                  ),
                  Text(
                    "| Including taxes and duties",
                    style: AppTextStyles.font12W400,
                  )
                ],
              ),
              Text(
                "Color ",
                style: AppTextStyles.font24W600,
              ),
              const ProductColorsAndRating(),
              verticalSpace(10),
        Text("Description", style: AppTextStyles.font24W600),
        verticalSpace(10),
        ReadMoreText(
          "The Iphone16 pro max is a compact device that can be taken everywhere. This portable superdevice is also equipped with 2 gamepadsrywryeryyer sFDGgdh wtwreheh dhdhd dghdh reyyyy ggggg ffff",
          trimLines: 3,
          colorClickableText: Colors.blue,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read more',
          trimExpandedText: ' Show less',
          style: AppTextStyles.font14W600.copyWith(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.customWhiteColor
                : AppColors.customLightGrayColor,
          ),
          moreStyle: TextStyle(
              fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        verticalSpace(10),
        const SimilarTOListView(),
        verticalSpace(30),
        ButtonItem(onPressed: (){},text: "Add to cart",radius: 30,),
        verticalSpace(10),
        ButtonItem(onPressed: (){},text: "Buy Now",color: AppColors.customRedColor,radius: 30,),
        verticalSpace(33)
        
        
            ],
          ),
        ),
      ),
    );
  }
}
