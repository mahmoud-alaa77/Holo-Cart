import 'package:flutter/material.dart';

import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/features/product_details/ui/widgets/phote_product_details.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.customDarkWhiteColor,
      body: Column(
        children: [
          PhotoProductDetails()
        ],
      ),
    );
  }
}


