import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/features/cart/ui/widgets/cart_item.dart';

class CartItemListview extends StatelessWidget {
  const CartItemListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
        itemBuilder: (context, index) => const CartItem(),
        itemCount: 5,
      ),
    );
  }
}
