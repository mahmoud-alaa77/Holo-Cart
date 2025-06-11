import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/profile/ui/views/address/ui/widgets/shipping_address_list_view.dart';



class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Address',
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
          children: [
            const Expanded(
              child: ShippingAddressListView(),
            ),
            verticalSpace(16),
            ButtonItem(
              text: 'ADD NEW ADDRESS',
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.addNewAddress);
              },
              color: AppColors.primaryOrangeColor,
            ),
          ],
        ),
      ),
    );
  }
}

