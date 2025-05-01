import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class CategoryCircleItem extends StatelessWidget {
  final int index;
  final int categoryId;
  final String title;
  final String image;
  const CategoryCircleItem({
    super.key,
    required this.index,
    required this.title,
    required this.image,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: 6.h, bottom: 6.h, start: index == 0 ? 0 : 8.h, end: 8.h),
      child: GestureDetector(
        onTap: () async {
          // BlocProvider.of<GetProductsInCategoryCubit>(context)
          //     .getAllProductsInCategory(id: 16);
          await context.push(AppRoutes.allProductsInCategory,
              extra: categoryId);
        },
        child: Column(
          children: [
            verticalSpace(3),
            Stack(alignment: Alignment.center, children: [
              Container(
                width: 57.w,
                height: 57.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 6,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  // border: Border.all(
                  //     color: AppColors.customLightGrayColor.withOpacity(.2),
                  //     width: 1),
                  //    color: AppColors.customLightGrayColor.withValues(alpha: .1),
                ),
              ),
              Container(
                width: 50.w,
                height: 50.w,
                padding: EdgeInsets.all(7.r),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    )),
              ),
            ]),
            verticalSpace(4),
            Text(
              title,
              style: AppTextStyles.font15W500,
            ),
          ],
        ),
      ),
    );
  }
}
