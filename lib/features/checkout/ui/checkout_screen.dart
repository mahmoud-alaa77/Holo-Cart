import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/appbar_screen.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/cart/ui/widgets/total_payment.dart';
import 'package:holo_cart/features/checkout/ui/widgets/edit_checkout_details.dart';
import 'package:holo_cart/features/checkout/ui/widgets/payment_method.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal:5.w ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(25),
            const AppbarScreen(title: 'Checkout'),
            verticalSpace(40),
            const EditCheckoutDetails(
                location: AppRoutes.address,
                title: "Shipping Address",
                subtitle: 'Add Shipping Address'),
            const EditCheckoutDetails(
                location: AppRoutes.profilePayment,
                title: "Payment Method",
                subtitle: 'Add Payment Method'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select your payment method',
                    style: AppTextStyles.font14W500,
                  ),
                  verticalSpace(10),
                  Center(
                      child: SvgPicture.asset(
                    'assets/images/card.svg',
                  )),
                  const PaymentMethod(),
                  verticalSpace(15),
                  const TotalPayment(),
                  verticalSpace(10),
                  ButtonItem(
                    text: "Place Order",
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.checkout);
                    },
                    color: AppColors.customRedColor,
                    radius: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
