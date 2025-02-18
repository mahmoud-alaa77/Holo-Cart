import 'package:flutter/material.dart';
import 'package:holo_cart/core/themes/app_colors.dart';


class ButtonItem extends StatelessWidget {
  const ButtonItem({
    super.key, required this.text, required this.onPressed, this.color, this.radius,
  });
  final String text;
  final void Function() onPressed;
  final Color? color;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
          color: color?? AppColors.customBlackColor,
          borderRadius: BorderRadius.circular(radius??15)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style:const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}