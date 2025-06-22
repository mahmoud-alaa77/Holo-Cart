import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/appbar_screen.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:holo_cart/features/checkout/logic/cubit/stripe_payment_cubit.dart';
import 'package:holo_cart/features/checkout/ui/widgets/edit_checkout_details.dart';
import 'package:holo_cart/features/checkout/ui/widgets/payment_method.dart';

class CheckoutScreen extends StatelessWidget {
  final double total;
  final String currency;

  const CheckoutScreen({
    super.key,
    required this.total,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(25),
            const AppbarScreen(title: 'Checkout'),
            verticalSpace(40),
            const EditCheckoutDetails(
              location: AppRoutes.address,
              title: "Shipping Address",
              subtitle: 'Add Shipping Address',
            ),
            const EditCheckoutDetails(
              location: AppRoutes.profilePayment,
              title: "Payment Method",
              subtitle: 'Add Payment Method',
            ),
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
                  Center(child: SvgPicture.asset('assets/images/card.svg')),
                  PaymentMethod(total: total, currency: currency),
                  verticalSpace(15),
                  verticalSpace(10),
                  BlocConsumer<StripePaymentCubit, StripePaymentState>(
  listener: (context, state) {
    if (state is StripePaymentLoading) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );
    }

    if (state is StripePaymentSuccess) {
      GoRouter.of(context).pop(); // Close loading
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Payment Successful!'),
          backgroundColor: Colors.green,
        ),
      );
      GoRouter.of(context).go(AppRoutes.done); // Navigate to success screen
    }

    if (state is StripePaymentFailure) {
      log(state.errorMessage);  
      Navigator.pop(context); // Close loading
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  },
  builder: (context, state) {
    return ButtonItem(  



      text: "Place Order",
      onPressed: () {
        final cubit = context.read<StripePaymentCubit>();
        // final userId = SharedPrefHelper.getInt(SharedPrefKeys.userId);

        cubit.makePayment(
          PaymentIntentInputModel(
            amount: (total * 100).toStringAsFixed(0), // Convert to cents
            currency: currency,
            // Assuming userId is a string
          ),
        );
      },
      color: AppColors.customRedColor,
      radius: 30,
    );
  },
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