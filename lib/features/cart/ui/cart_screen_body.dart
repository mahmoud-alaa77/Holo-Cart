import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/cart/logic/cubit/cart_cubit.dart';
import 'package:holo_cart/features/cart/ui/widgets/bag_and_button.dart';
import 'package:holo_cart/features/cart/ui/widgets/cart_item.dart';

class CartScreenBody extends StatelessWidget {
  CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is GetCartItemsSuccess) {
            final double total = state.cartItems.fold(
              0.0,
              (sum, item) => sum + item.price * item.quantity,
            );

            if (state.cartItems.isEmpty) {
              return const Center(child: BagAndButton());
            }
            return Column(
              children: [
                verticalSpace(20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.read<CartCubit>().clearCart();
                    },
                    child: Text(
                      "Remove all",
                      style: AppTextStyles.font16W500.copyWith(
                        color: AppColors.customRedColor,
                      ),
                    ),
                  ),
                ),
                verticalSpace(16),
                Expanded(
                  child: SizedBox(
                    height: 400.h,
                    child: ListView.builder(
                      itemBuilder: (context, index) => Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          context
                              .read<CartCubit>()
                              .deleteItem(state.cartItems[index].productId);
                          log(state.cartItems[index].price.toString());
                        },
                        confirmDismiss: (direction) async {
                          context
                              .read<CartCubit>()
                              .deleteItem(state.cartItems[index].productId);
                          log(state.cartItems[index].price.toString());
                          return null;
                        },
                        background: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        secondaryBackground: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        child: CartItem(
                          cartItem: state.cartItems[index],
                        ),
                      ),
                      itemCount: state.cartItems.length,
                    ),
                  ),
                ),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: AppTextStyles.font16W500,
                    ),
                    Text(
                      "\$ ${total.toStringAsFixed(2)}",
                      style: AppTextStyles.font16W400.copyWith(
                        color: AppColors.customLightGrayColor,
                      ),
                    ),
                  ],
                ),
                verticalSpace(30),
                ButtonItem(
                  text: "Checkout",
                  onPressed: () {
                    GoRouter.of(context).push(
                      AppRoutes.checkout,
                      extra: {
                        'total': total,
                        'currency': 'usd',
                      },
                    );
                  },
                  color: AppColors.customRedColor,
                  radius: 30,
                ),
                verticalSpace(24),
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
