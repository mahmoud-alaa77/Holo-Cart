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
import 'package:holo_cart/features/cart/ui/widgets/cart_item.dart';

class CartScreenBody extends StatelessWidget {
  CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          verticalSpace(20),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Remove all",
              style: AppTextStyles.font16W500,
            ),
          ),
          SizedBox(
            height: 350.h,
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is GetCartItemsSuccess) {
                  return ListView.builder(
                    itemBuilder: (context, index) => CartItem(
                      cartItem: state.cartItems[index],
                    ),
                    itemCount: state.cartItems.length,
                  );
                }
                return const SizedBox();
              },
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
                "\$999",
                style: AppTextStyles.font16W400
                    .copyWith(color: AppColors.customLightGrayColor),
              )
            ],
          ),
          verticalSpace(30),
          Image.asset("assets/images/promocode.png"),
          verticalSpace(30),
          ButtonItem(
            text: "Checkout",
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.checkout);
            },
            color: AppColors.customRedColor,
            radius: 30,
          )
        ],
      ),
    );
  }
}
// Center(
//         child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//           Expanded(
//             child: Text(
//               "Cart",
//               style: AppTextStyles.font24W600,
//             ),
//           ),
//           Expanded(flex: 3, child: const BagAndButton()),
//         ]),
//       ),
