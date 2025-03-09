import 'package:flutter/material.dart';

import 'package:holo_cart/features/product_details/ui/widgets/information_product_details.dart';
import 'package:holo_cart/features/product_details/ui/widgets/phote_product_details.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [PhotoProductDetails(), InformationProductDetails()],
        ),
      ),
    );
  }
}
