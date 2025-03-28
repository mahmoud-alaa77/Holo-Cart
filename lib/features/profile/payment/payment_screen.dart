import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/profile/payment/widgets/cards_textfildes.dart';
import 'package:holo_cart/features/profile/payment/widgets/paypal_item.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<TextEditingController> addressControllers = [
    TextEditingController(text: '0123459756'),
    TextEditingController(text: '01122334455'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(30),
            Text("Cards", style: AppTextStyles.font18W500),
            SizedBox(
              height: 150.h,
              child: ListView.builder(
                itemCount: addressControllers.length,
                itemBuilder: (context, index) {
                  return CardItem(controller: addressControllers[index]);
                },
              ),
            ),
            verticalSpace(30),
            Text("paypal", style: AppTextStyles.font18W500),
            const PaypalItem(),
            Expanded(child: Center(child: SvgPicture.asset("assets/images/card.svg"))),
            ButtonItem(
              text: 'Add',
              onPressed: () {
                GoRouter.of(context).push(
                  AppRoutes.cardNumber,
                  extra: [],
                );
              },
              color: AppColors.primaryOrangeColor,
            ),
          ],
        ),
      ),
    );
  }
}
