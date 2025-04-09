import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/appbar_screen.dart';
import 'package:holo_cart/core/widgets/button_item.dart';

import 'package:holo_cart/features/cart/ui/widgets/cart_item_listview.dart';
import 'package:holo_cart/features/cart/ui/widgets/total_payment.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            verticalSpace(20),
            const AppbarScreen(title: 'Cart'),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Remove all",
                style: AppTextStyles.font16W500,
              ),
            ),
            const CartItemListview(),
            verticalSpace(20),
            const TotalPayment(),
            verticalSpace(30),
            Image.asset("assets/images/promocode.png"),
            verticalSpace(30),
            ButtonItem(
              text: "Checkout",
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.checkout);
              },
              color: AppColors.customRedColor,radius: 30,
            )
          ],
        ),
      ),
    );
  }
}
