import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/home/ui/widgets/hot_sales_section/hot_sales_product_item.dart';

class AllProductsSection extends StatelessWidget {
  const AllProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsetsDirectional.symmetric(vertical: 8.r, horizontal: 16.r),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "All Products",
              style: AppTextStyles.font20W700,
            ),
          ),
        ),
        verticalSpace(16),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 9 / 15,
              mainAxisSpacing: 10.r),
          itemBuilder: (context, index) {
            return const HotSalesProductItem();
          },
        )
      ],
    );
  }
}
