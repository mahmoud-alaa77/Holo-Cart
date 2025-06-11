import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/creat_shipping_address/shipping_address_cubit.dart';

class BlocListenerShippingAddress extends StatelessWidget {
  const BlocListenerShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShippingAddressCubit, ShippingAddressState>(
      listenWhen: (previous, current) =>
          current is ShippingAddressSuccess || current is ShippingAddressLoading   || current is ShippingAddressFailure,
      listener: (context, state) {
        if (state is ShippingAddressLoading) {
          showDialog(
              context: context,
              builder: (context) =>  Center(
                child:Image.asset(
                  'assets/images/loading.gif',
                  width: 50,
                  height: 50,)
              ),
            );
        } else if (state is ShippingAddressSuccess) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Address added successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is ShippingAddressFailure) {
          context.pop();
          
          log('Error khaled: ${state.error}');
          setupErrorState(context, state.error);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
void setupErrorState(BuildContext context,  String errorMessage) {
  
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        errorMessage,
        style: AppTextStyles.font15W500
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: AppTextStyles.font14W600,
          ),
        ),
      ],
    ),
  );
}