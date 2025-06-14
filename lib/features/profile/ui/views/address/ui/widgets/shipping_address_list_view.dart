import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/display_shipping_address/get_address_response_model.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/get_shipping_address/get_shipping_address_cubit.dart';

class ShippingAddressListView extends StatelessWidget {
  const ShippingAddressListView({
    super.key,
    this.addressResponseModel,
  });

  final GetAddressResponseModel? addressResponseModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: addressResponseModel?.data.length ?? 0,
      itemBuilder: (context, index) {
        return Container(
          height: 50.h,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(),
                  padding: EdgeInsets.zero,
                  child: Text(
                      ' ${addressResponseModel?.data[index].addressLine1 ?? 'No Address'}',
                      style: AppTextStyles.font16W500),
                ),
              ),
              GestureDetector(
  onTap: () async {
    final shouldRefresh = await GoRouter.of(context).push<bool>(
      AppRoutes.addNewAddress,
      extra: {
        'content': addressResponseModel!.data[index],
        'isEdit': true,
        'getCubit': context.read<GetShippingAddressCubit>(),
      },
    );

    if (shouldRefresh == true) {
      context.read<GetShippingAddressCubit>().fetchShippingAddress(); // 🔁
    }
  },
  child: const Text(
    'Edit',
    style: TextStyle(
      color: Colors.orange,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
),

            ],
          ),
        );
      },
    );
  }
}
