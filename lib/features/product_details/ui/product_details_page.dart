import 'package:flutter/material.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';

import 'package:holo_cart/features/product_details/ui/widgets/information_product_details.dart';
import 'package:holo_cart/features/product_details/ui/widgets/phote_product_details.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductData product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PhotoProductDetails(
              image: product.mainImageUrl.toString(),
            ),
            InformationProductDetails(
              product: product,
            )
          ],
        ),
      ),
    );
  }
}
