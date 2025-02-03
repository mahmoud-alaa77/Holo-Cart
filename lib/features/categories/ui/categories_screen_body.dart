import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/categories/ui/widgets/category_cart_item.dart';
import 'package:holo_cart/features/home/ui/widgets/category_circle_item.dart';

import '../../../core/helper/spacing.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 12.r),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 16.r, vertical: 16.r),
                child: Row(
                  children: [
                    Text(
                      "All Categories",
                      style: AppTextStyles.font22W900,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .75,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return CategoryCartItem(
                    categoryName: categories[index],
                  );
                },
              ),
              verticalSpace(60.h)
            ],
          ),
        ),
      )
    ]);
  }
}
