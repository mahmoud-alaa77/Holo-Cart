import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/custom_rating_widget.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';

class HotSalesProductItem extends StatelessWidget {
  final ProductData product;
  final String discount;
  const HotSalesProductItem({
    super.key,
    required this.product,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.productDetails, extra: product);
      },
      child: Container(
        margin:
            EdgeInsetsDirectional.symmetric(horizontal: 12.r, vertical: 4.r),
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
        width: MediaQuery.sizeOf(context).width / 2.3,
        height: 260.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
                child: Image.network(
                  product.mainImageUrl.toString(),
                  height: 125.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // loadingBuilder: (context, child, loadingProgress) {
                  //   if (loadingProgress == null) return child;
                  //   return Center(
                  //     child: CircularProgressIndicator(
                  //       value: loadingProgress.expectedTotalBytes != null
                  //           ? loadingProgress.cumulativeBytesLoaded /
                  //               loadingProgress.expectedTotalBytes!
                  //           : null,
                  //       strokeWidth: 2,
                  //     ),
                  //   );
                  // },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                )),
            verticalSpace(6),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 6.r),
              child: Text(
                product.name ?? "",
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
            Row(
              children: [
                horizontalSpace(8),
                Text(
                  "${product.finalPrice}\$",
                  style: AppTextStyles.font16W500,
                ),
                horizontalSpace(8),
                Text(
                  "${product.basePrice! + product.basePrice! * (int.parse(discount) / 100)}\$",
                  style: AppTextStyles.font13W400.copyWith(
                      color: AppColors.customLightGrayColor,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 10.sp),
                ),
                const Spacer(),
                Text(
                  "$discount% OFF",
                  style: AppTextStyles.font12W400.copyWith(
                      color: AppColors.primaryOrangeColor, fontSize: 8.sp),
                ),
                horizontalSpace(8)
              ],
            ),
            verticalSpace(6),
            CustomRatingWidget(
              numberOfRatings: product.reviews?.length.toInt() ?? 0,
            ),
          ],
        ),
      ),
    );
  }
}
