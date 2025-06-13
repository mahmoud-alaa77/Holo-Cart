import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/shiping_address_requset.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/cubit/shipping_address_cubit.dart';
import 'package:holo_cart/features/profile/ui/views/address/ui/widgets/bloc_listener_shipping_address.dart';

import 'widgets/address_text_fields.dart';

class EditAddressScreen extends StatelessWidget {
 

  const EditAddressScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          
          'Add Address',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const AddressTextFields(),
              const BlocListenerShippingAddress(),
              ButtonItem(
                text: 'Save Address',
                onPressed: () {
                  validateShippingAddress(context);
                 
                },
                color: AppColors.customBlueColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void validateShippingAddress(BuildContext context) async {
  final id = await SharedPrefHelper.getInt(SharedPrefKeys.userId); 

  if (context.read<ShippingAddressCubit>().formKey.currentState!.validate()) {
    context.read<ShippingAddressCubit>().createShippingAddress(
      ShippingAddressRequest(
        userId: id,
        addressLine1: context.read<ShippingAddressCubit>().address1Controller.text,
        addressLine2: context.read<ShippingAddressCubit>().address2Controller.text,
        city: context.read<ShippingAddressCubit>().cityController.text,
        country: context.read<ShippingAddressCubit>().countryController.text,
        state: context.read<ShippingAddressCubit>().stateController.text,
        zipCode: context.read<ShippingAddressCubit>().zipCodeController.text,
      ),
    );
  }
}
