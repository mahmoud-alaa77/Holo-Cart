import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class CategoryCartItem extends StatelessWidget {
  final String categoryName;
  const CategoryCartItem({
    super.key, required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          margin:
              EdgeInsetsDirectional.symmetric(horizontal: 6.h, vertical: 4.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withValues(alpha: .5), blurRadius: 1.r),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset("assets/images/category.jpg",
                        height: 120.h,
                        width: double.infinity,
                        fit: BoxFit.fill)),
              ),
              verticalSpace(8),
              Text(
                categoryName,
                style: AppTextStyles.font18W500,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpace(8),
            ],
          )),
    );
  }
}
