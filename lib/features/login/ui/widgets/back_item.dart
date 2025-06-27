import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

class BackItem extends StatelessWidget {
  const BackItem({
    super.key, this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.customBlackColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
          onPressed: onPressed ?? () {
            // Navigate back to the previous screen
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryOrangeColor,
          )),
    );
  }
}
