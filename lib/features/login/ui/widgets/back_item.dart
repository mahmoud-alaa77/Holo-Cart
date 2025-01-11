import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/routing/app_router.dart';
import 'package:holo_cart/core/routing/routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

class BackItem extends StatelessWidget {
  const BackItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.customBlackColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
          onPressed: () {
            // Navigate back to the previous screen
            GoRouter.of(context).go(Routes.mainAuth);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryOrangeColor,
          )),
    );
  }
}
