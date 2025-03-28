import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.radius,
    this.height,
    this.width,
    this.buttonTextStyle,
  });
  final String text;
  final void Function() onPressed;
  final Color? color;
  final double? radius;
  final double? height;
  final TextStyle? buttonTextStyle;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 45.h,
      width: width ?? MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: color ?? AppColors.customBlackColor,
          borderRadius: BorderRadius.circular(radius ?? 15)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: buttonTextStyle ??
              const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
