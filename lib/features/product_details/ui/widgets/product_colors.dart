import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

import 'package:holo_cart/core/themes/app_text_styles.dart';

class ProductColors extends StatefulWidget {
  final List<Color> colors;
  final List<String> images;
  const ProductColors({super.key, required this.colors, required this.images});

  @override
  _ProductColorsState createState() => _ProductColorsState();
}

class _ProductColorsState extends State<ProductColors> {
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
            if (widget.colors.isEmpty) ...[
              Text(
                "No colors available",
                style: AppTextStyles.font14W600.copyWith(color: Colors.red),
              ),
            ] else ...[
              ...List.generate(widget.colors.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColorIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.colors[index],
                      border: Border.all(
                        color: selectedColorIndex == index
                            ? Colors.black.withAlpha(100)
                            : Colors.transparent,
                        width: selectedColorIndex == index ? 3.w : 0,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ],
        ),
        verticalSpace(10),
        Image.network(widget.images[selectedColorIndex],
            width: MediaQuery.of(context).size.width - 120.w,
            height: 200.h,
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error)),
      ],
    );
  }
}
