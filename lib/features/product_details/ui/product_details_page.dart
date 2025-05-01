import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:holo_cart/features/product_details/logic/cubit/get_product_colors_cubit.dart';

import 'package:holo_cart/features/product_details/ui/widgets/information_product_details.dart';
import 'package:holo_cart/features/product_details/ui/widgets/phote_product_details.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductData product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetProductColorsCubit>(context)
        .getProductColors(widget.product.productId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PhotoProductDetails(
              image: widget.product.mainImageUrl.toString(),
            ),
            InformationProductDetails(
              product: widget.product,
            )
          ],
        ),
      ),
    );
  }
}
