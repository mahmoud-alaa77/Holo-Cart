import 'package:flutter/material.dart';
import 'package:holo_cart/core/themes/app_colors.dart';


class ButtonItem extends StatelessWidget {
  const ButtonItem({
    super.key, required this.text, required this.onPressed,
  });
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
          color: AppColors.customBlackColor,
          borderRadius: BorderRadius.circular(15)),
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