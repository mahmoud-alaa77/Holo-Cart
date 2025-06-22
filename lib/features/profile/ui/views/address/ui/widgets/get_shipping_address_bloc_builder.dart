import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/get_shipping_address/get_shipping_address_cubit.dart';
import 'package:holo_cart/features/profile/ui/views/address/ui/widgets/shipping_address_list_view.dart';

class GetShippingAddressBlocBuilder extends StatelessWidget {
  const GetShippingAddressBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetShippingAddressCubit, GetShippingAddressState>(
      builder: (context, state) {
        if (state is GetShippingAddressLoading) {
          return Center(child: const CircularProgressIndicator());
        } else if (state is GetShippingAddressLoaded) {
          final addressResponseModel = state.getAddressResponseModel;
          return ShippingAddressListView(addressResponseModel: addressResponseModel);
        } else if (state is GetShippingAddressError) {
          log( "Error fetching shipping address: ${state.errorMessage}");
          return Text("خطأ: ${state.errorMessage}");
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}