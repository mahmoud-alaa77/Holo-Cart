import 'package:flutter/material.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/widgets/auth_textfield.dart';
import 'package:holo_cart/core/widgets/button_item.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key, required this.controller});
  final List<TextEditingController> controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'add card',
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          children: [
             AuthTextfield(
  controller: controller.isNotEmpty ? controller.first : TextEditingController(),
  hintText: "Card Number",
  fillColor: AppColors.customLightColor,
),
            verticalSpace(10),
            Row(
              children: [
                const Expanded(
                  child: AuthTextfield(
                    hintText: "Expiry Date",
                    fillColor: AppColors.customLightColor,
                  ),
                ),
                horizontalSpace(10),
                const Expanded(
                  child: AuthTextfield(
                    hintText: "CVV",
                    fillColor: AppColors.customLightColor,
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            const Expanded(
              child: AuthTextfield(
                hintText: "Card Holder Name",
                fillColor: AppColors.customLightColor,
              ),
            ),
            ButtonItem(
              text: "save",
              onPressed: () {},
              color: AppColors.customRedColor,
            )
          ],
        ),
      ),
    );
  }
}
