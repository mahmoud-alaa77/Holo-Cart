import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/networking/api_constants.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/appbar_screen.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/core/widgets/custom_loading_widget.dart';
import 'package:holo_cart/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:holo_cart/features/checkout/logic/cubit/stripe_payment_cubit.dart';
import 'package:holo_cart/features/checkout/ui/widgets/edit_checkout_details.dart';
import 'package:holo_cart/features/checkout/ui/widgets/payment_method.dart';
import 'package:lottie/lottie.dart';

class CheckoutScreen extends StatefulWidget {
  final double total;
  final String currency;

  const CheckoutScreen({
    super.key,
    required this.total,
    required this.currency,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  PaymentType? selectedPayment;

  void _initiatePayPalPayment() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiConstants.paypalClientId,
          secretKey: ApiConstants.paypalSecretKey,
          transactions: [
            {
              "amount": {
                "total": widget.total.toStringAsFixed(2),
                "currency": widget.currency,
                "details": {
                  "subtotal": widget.total.toStringAsFixed(2),
                  "tax": '0',
                  "shipping": '0',
                  "handling_fee": '0',
                  "shipping_discount": '0',
                  "insurance": '0'
                }
              },
              "description": "Payment for your order",
              "item_list": {
                "items": [
                  {
                    "name": "Order Total",
                    "quantity": 1,
                    "price": widget.total.toStringAsFixed(2),
                    "currency": widget.currency
                  }
                ],
              }
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            _handlePayPalSuccess(params);
          },
          onError: (error) {
            _handlePayPalError(error);
          },
          onCancel: () {
            _handlePayPalCancel();
          },
        ),
      ),
    );
  }

  void _handlePayPalSuccess(Map params) {
    GoRouter.of(context).pop();

    GoRouter.of(context).go(AppRoutes.proccessingOrder);
  }

  void _handlePayPalError(error) {
    GoRouter.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PayPal Payment Error: $error'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _handlePayPalCancel() {
    GoRouter.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('PayPal Payment was cancelled.'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            verticalSpace(25),
            const AppbarScreen(title: 'Checkout'),
            verticalSpace(40),
            const EditCheckoutDetails(
              location: AppRoutes.address,
              title: "Shipping Address",
              subtitle: 'Add Shipping Address',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select your payment method',
                      style: AppTextStyles.font14W500),
                  verticalSpace(10),
                  verticalSpace(10),
                  PaymentMethod(
                    onMethodSelected: (method) {
                      setState(() {
                        selectedPayment = method;
                      });
                    },
                  ),
                  Lottie.asset("assets/images/p4.json",
                width:double.infinity , height: 250.h ), 
                  verticalSpace(20),
                  BlocConsumer<StripePaymentCubit, StripePaymentState>(
                    listener: (context, state) {
                      if (state is StripePaymentLoading) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => const CustomLoadingWidget(),
                        );
                      }
                      if (state is StripePaymentSuccess) {
                        GoRouter.of(context).pop();

                        GoRouter.of(context).go(AppRoutes.proccessingOrder);
                      }
                      if (state is StripePaymentCancelled) {
                        GoRouter.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Payment was cancelled.'),
                              backgroundColor: Colors.orange),
                        );
                      }
                      if (state is StripePaymentFailure) {
                        GoRouter.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(state.errorMessage),
                              backgroundColor: Colors.red),
                        );
                        log(
                          'Stripe Payment Error: ${state.errorMessage}',
                        );
                      }
                    },
                    builder: (context, state) {
                      return ButtonItem(
                        text: "Place Order",
                        onPressed: () {
                          if (selectedPayment == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Please select a payment method.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          if (selectedPayment == PaymentType.stripe) {
                            context.read<StripePaymentCubit>().makePayment(
                                  PaymentIntentInputModel(
                                    amount:
                                        (widget.total * 100).toStringAsFixed(0),
                                    currency: widget.currency,
                                  ),
                                );
                          }

                          if (selectedPayment == PaymentType.paypal) {
                            _initiatePayPalPayment();
                          }
                        },
                        color: AppColors.customRedColor,
                        radius: 30,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
