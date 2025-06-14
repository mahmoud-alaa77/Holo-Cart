import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/profile/ui/views/address/ui/widgets/get_shipping_address_bloc_builder.dart';
import 'package:holo_cart/features/profile/ui/views/address/ui/widgets/shipping_address_list_view.dart';

import '../logic/get_shipping_address/get_shipping_address_cubit.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({
    super.key,
  });

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ShippingAddressListView(),
              const GetShippingAddressBlocBuilder(),
              verticalSpace(16.0),
            ],
          ),
        ),
      ),
     bottomNavigationBar: Padding(
  padding: const EdgeInsets.all(16.0),
  child: ButtonItem(
    text: 'ADD NEW ADDRESS',
    onPressed: () async {
      final shouldRefresh = await GoRouter.of(context).push<bool>(
        AppRoutes.addNewAddress,
        extra: {
          'content': null,
          'isEdit': false,
          'getCubit': context.read<GetShippingAddressCubit>(),
        },
      );

      if (shouldRefresh == true) {
        context.read<GetShippingAddressCubit>().fetchShippingAddress(); 
      }
    },
    color: AppColors.primaryOrangeColor,
  ),
),
    );
  }
}
