import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/product_details/ui/widgets/similar_to_cart_item.dart';

class SimilarTOListView extends StatelessWidget {
  const SimilarTOListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Similar To",
          style: AppTextStyles.font24W600,
        ),
        verticalSpace(10),
        SizedBox(
          width: double.infinity,
          height: 200.h,
          child: ListView.builder(

            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const SimilarToCartItem(),
            itemCount: 5,
          ),
        )
      ],
    );
  }
}