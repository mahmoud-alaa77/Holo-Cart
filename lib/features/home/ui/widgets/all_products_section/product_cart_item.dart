import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/custom_rating_widget.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';

import '../../../../../core/helper/spacing.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({
    super.key,
    required this.product,
  });

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.productDetails, extra: product);
      },
      child: Container(
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
                child: Image.network(
                  product.mainImageUrl.toString(),
                  height: 120.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      height: 120.h,
                      width: double.infinity,
                      child: const Center(
                        child: Icon(Icons.error),
                      ),
                    );
                  },
                )),
            verticalSpace(6),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 6.r),
              child: Text(
                product.name!,
                style: AppTextStyles.font18W500,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            verticalSpace(2),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 6.r),
              child: Text(
                product.description ?? "",
                style: AppTextStyles.font14W500,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            verticalSpace(3),
            Text(
              " ${product.finalPrice}\$",
              style: AppTextStyles.font16W500,
            ),
            verticalSpace(6),
            CustomRatingWidget(
              numberOfRatings: product.reviews?.length ?? 0,
            ),
          ],
        ),
      ),
    );
  }
}
