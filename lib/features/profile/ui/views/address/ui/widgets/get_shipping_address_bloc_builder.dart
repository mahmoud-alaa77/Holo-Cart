import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/custom_loading_widget.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/get_shipping_address/get_shipping_address_cubit.dart';
import 'package:holo_cart/features/profile/ui/views/address/ui/widgets/empty_item.dart';
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
        } else if (state is GetShippingAddressEmpty) {
          const Center(child: Emptyitem());
        } else if (state is DeleteShippingAddressError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(' ${state.errorMessage}'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is GetShippingAddressLoaded) {
          return ShippingAddressListView(
            addressResponseModel: state.getAddressResponseModel,
          );
        } else if (state is GetShippingAddressLoading) {
          return const Center(
            child: Align(
              alignment: Alignment.center,
              child: CustomLoadingWidget(),
            ),
          );
        } else if (state is GetShippingAddressEmpty) {
          return const Center(child: Emptyitem());
        } else if (state is GetShippingAddressError) {
          log("Error fetching shipping address: ${state.errorMessage}");
          return Center(
            child: Text(
              "  Erorr: ${state.errorMessage}",
              style: AppTextStyles.font16W600,
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
