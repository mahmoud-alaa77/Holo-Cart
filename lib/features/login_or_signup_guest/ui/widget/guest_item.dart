import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

class GuestItem extends StatelessWidget {
  const GuestItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8 , bottom: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Stack(
        children: [
         
          Text(
            "Continue as a guest",
            style: TextStyle(
              fontSize: 20,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1.5
                ..color = Colors.black,
            ),
          ),
         const Text(
            "Continue as a guest",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
          const Icon(
            Icons.arrow_forward,
            color: AppColors.customBlackColor,
          ),
        ],
      ),
    );
  }
}
