import 'package:animated_rating_bar/widgets/animated_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class CustomRatingWidget extends StatelessWidget {
  final int numberOfRatings;
  const CustomRatingWidget({
    super.key,
    required this.numberOfRatings,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpace(6),
        AnimatedRatingBar(
          activeFillColor: AppColors.customYellowColor,
          strokeColor: AppColors.customYellowColor,
          initialRating: 4,
          width: 80.w,
          height: 20.h,
          // width: MediaQuery.of(context).size.width,
          animationColor: AppColors.customRedColor,
          onRatingUpdate: (rating) {
            // debugPrint(rating.toString());
          },
        ),
        horizontalSpace(3),
        Text("($numberOfRatings)",
            style: AppTextStyles.font13W500
                .copyWith(color: AppColors.customLightGrayColor)),
      ],
    );
  }
}
