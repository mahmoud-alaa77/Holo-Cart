import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class TimeBoxWidget extends StatelessWidget {
  final String contentTime;
  const TimeBoxWidget({
    super.key,
    required this.contentTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 30.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black),
      child: Center(
          child: Text(
        contentTime,
        style: AppTextStyles.font15W400.copyWith(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : Colors.white),
      )),
    );
  }
}
