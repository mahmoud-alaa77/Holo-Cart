import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:holo_cart/core/themes/app_text_styles.dart';


class ProductColorsAndRating extends StatefulWidget {
  const ProductColorsAndRating({super.key});

  @override
  _ProductColorsAndRatingState createState() => _ProductColorsAndRatingState();
}

class _ProductColorsAndRatingState extends State<ProductColorsAndRating> {
  final List<Color> colors = const [
    Color(0xFF7C81F0),
    Color(0xFF3C3C3C),
    Color(0xFFF5A9B8),
    Color(0xFF87A6A6),
  ];

  int selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...List.generate(colors.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColorIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  width: 25.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors[index],
                    border: Border.all(
                      color: selectedColorIndex == index
                          ? Colors.blue
                          : Colors.transparent,
                      width: selectedColorIndex == index ? 3.w : 0,
                    ),
                  ),
                ),
              );
            }),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20.sp),
                SizedBox(width: 4.w),
                Text(
                  "4.8",
                  style: AppTextStyles.font18W600,
                ),
                SizedBox(width: 4.w),
                Text(
                  "(231)",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        
      ],
    );
  }
}


