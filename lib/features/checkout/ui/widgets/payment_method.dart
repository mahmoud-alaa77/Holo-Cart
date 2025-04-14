import 'package:flutter/material.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/checkout/ui/widgets/pay_method_item.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("+Add New" ,style: AppTextStyles.font15W600,),
        verticalSpace(8),
      const  Row(
          children: [
            PayMethodItem(assetsName:"assets/images/google_pay.png" ),
             PayMethodItem(assetsName: 'assets/images/Apple_Pay_logo.png' ),
              PayMethodItem(assetsName:'assets/images/paypal.png' ),
          ],
        )

      ],
    );
  }
}