import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class CategoryCircleItem extends StatelessWidget {
  final int index;
  final String title;
  final String image;
  const CategoryCircleItem({
    super.key,
    required this.index,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: 6.h, bottom: 6.h, start: index == 0 ? 0 : 8.h, end: 8.h),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                width: 57.w,
                height: 57.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        AppColors.customLightGrayColor.withValues(alpha: .5)),
              ),
              Container(
                width: 50.w,
                height: 50.w,
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

List<String> categories = [
  "Fashion",
  "Beauty",
  "Electronics",
  "Home",
  "Kitchen",
  "Games",
  "Sports",
  "Travel",
  "Toys",
  "Health",
  "Automotive",
  "Beauty",
  "Electronics",
  "Home",
  "Kitchen",
  "Games",
  "Sports",
  "Travel",
  "Toys",
  "Health",
  "Automotive",
  "More"
];
