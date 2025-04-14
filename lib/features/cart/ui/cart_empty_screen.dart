import 'package:flutter/material.dart';

import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/cart/ui/widgets/bag_and_button.dart';

class CartEmptyScreen extends StatelessWidget {
  const CartEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Expanded(
                child: Text(
                  "Cart",
                  style: AppTextStyles.font24W600,
                ),
              ),
              Expanded(flex: 3, child: const BagAndButton()),
            ]),
      ),
    );
  }
}
