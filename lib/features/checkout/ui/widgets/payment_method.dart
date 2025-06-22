import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:holo_cart/features/checkout/data/repo/stripe_repo.dart';
import 'package:holo_cart/features/checkout/logic/cubit/stripe_payment_cubit.dart';
import 'package:holo_cart/features/checkout/ui/widgets/pay_method_item.dart';

class PaymentMethod extends StatelessWidget {
  final double total;
  final String currency;

  const PaymentMethod({Key? key, required this.total, required this.currency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("+ Add New", style: AppTextStyles.font15W600),
        verticalSpace(8),
        BlocProvider(
          create: (_) => StripePaymentCubit(StripeRepo()),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
                    amount: total.toStringAsFixed(0),  // أو *100 لو Stripe بتستخدم cents
                    currency: currency,
                    
                     // أو تاخد من SharedPreferences
                  );
                  context.read<StripePaymentCubit>().makePayment(paymentIntentInputModel);
                },
                child: PayMethodItem(assetsName: "assets/images/google_pay.png"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}