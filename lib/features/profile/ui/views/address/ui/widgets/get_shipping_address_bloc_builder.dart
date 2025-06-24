import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/get_shipping_address/get_shipping_address_cubit.dart';
import 'package:holo_cart/features/profile/ui/views/address/ui/widgets/shipping_address_list_view.dart';

class GetShippingAddressBlocBuilder extends StatelessWidget {
  const GetShippingAddressBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetShippingAddressCubit, GetShippingAddressState>(
      listener: (context, state) {
        if (state is DeleteShippingAddressSuccess) {
          // إعادة تحميل البيانات في الخلفية بدون loading
          context.read<GetShippingAddressCubit>().fetchShippingAddress();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم حذف العنوان بنجاح'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        } else if (state is DeleteShippingAddressError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('حدث خطأ أثناء حذف العنوان: ${state.errorMessage}'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        // نظهر المحتوى حتى لو كان في حالة loading للحذف
        if (state is GetShippingAddressLoaded ||
            state is DeleteShippingAddressLoading) {
          final addressResponseModel = state is GetShippingAddressLoaded
              ? state.getAddressResponseModel
              : (context.read<GetShippingAddressCubit>().state
                      as GetShippingAddressLoaded)
                  .getAddressResponseModel;
          return ShippingAddressListView(
              addressResponseModel: addressResponseModel);
        } else if (state is GetShippingAddressLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetShippingAddressError) {
          log("Error fetching shipping address: ${state.errorMessage}");
          return Text("خطأ: ${state.errorMessage}");
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
