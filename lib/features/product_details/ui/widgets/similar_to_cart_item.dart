import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';

class SimilarToCartItem extends StatelessWidget {
  final ProductData product;
  const SimilarToCartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.productDetails, extra: product.productId);
      },
      child: Container(
        width: 150.w,
        margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.customBlackColor.withValues(alpha: .5)
              : const Color.fromARGB(255, 241, 239, 239),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              blurRadius: 3.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: Image.network(
                product.mainImageUrl.toString(),
                width: 150.w,
                height: 130.h,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
            ),
            verticalSpace(8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name.toString(),
                    style: AppTextStyles.font14W600,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    product.description.toString(),
                    style: AppTextStyles.font12W400,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${product.basePrice.toString()} \$",
                    style:
                        AppTextStyles.font12W700.copyWith(color: Colors.green),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
