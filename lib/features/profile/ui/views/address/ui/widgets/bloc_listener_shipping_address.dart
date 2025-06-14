import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/features/forget_password/ui/widgets/bloc_listener_forget_password.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/creat_shipping_address/shipping_address_cubit.dart';

import '../../logic/get_shipping_address/get_shipping_address_cubit.dart';

class BlocListenerShippingAddress extends StatelessWidget {
  const BlocListenerShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShippingAddressCubit, ShippingAddressState>(
      listenWhen: (previous, current) =>
          current is ShippingAddressSuccess ||
          current is ShippingAddressLoading ||
          current is ShippingAddressFailure,
      listener: (context, state) {
        if (state is ShippingAddressLoading) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: Image.asset(
                'assets/images/loading.gif',
                width: 50,
                height: 50,
              ),
            ),
          );
        } else if (state is ShippingAddressSuccess) {
          // هنا ينجح الحفظ، يتم تحديث الصفحة الرئيسية
          context.read<GetShippingAddressCubit>().fetchShippingAddress();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Address saved successfully!'),
              backgroundColor: Colors.green,
            ),
          );

          // ويتم إغلاق الصفحة الحالية
          context.pop();
        } else if (state is ShippingAddressFailure) {
          Navigator.pop(context); // اغلق اللودينج
          setupErrorState(context, state.error);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
