import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/forget_password/ui/widgets/bloc_listener_forget_password.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/display_shipping_address/get_address_response_model.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/creat_shipping_address/shipping_address_cubit.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/get_shipping_address/get_shipping_address_cubit.dart';
import 'package:holo_cart/features/profile/ui/views/address/ui/widgets/bloc_listener_shipping_address.dart';
import 'widgets/address_text_fields.dart';

class EditAndCreateAddressScreen extends StatelessWidget {
  final bool isEdit;
final ShippingAddressContentModel? content;
final GetShippingAddressCubit getCubit;
  const EditAndCreateAddressScreen({super.key, required this.isEdit, this.content, required this.getCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit ? 'Edit Address' : 'Add Address',
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const AddressTextFields(),
            BlocListener<ShippingAddressCubit, ShippingAddressState>(
              listenWhen: (previous, current) =>
                  current is ShippingAddressSuccess ||
                  current is ShippingAddressLoading ||
                  current is ShippingAddressFailure,
              listener: (context, state) async {
                if (state is ShippingAddressLoading) {
                  showDialog(
                    context: context,
                    builder: (_) => Center(
                      child: Image.asset(
                        'assets/images/loading.gif',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  );
                } else if (state is ShippingAddressSuccess) {
                  // ✅ عمل ريفريش لبيانات العناوين مباشرة
                  context.read<GetShippingAddressCubit>().fetchShippingAddress();

                  context.pop(true); // رجوع مع ريفريش

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Address saved successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is ShippingAddressFailure) {
                  Navigator.pop(context); // إغلاق اللودينج
                  setupErrorState(context, state.error);
                }
              },
              child: const SizedBox.shrink(),
            ),
            ButtonItem(
              text: isEdit ? 'Update Address' : 'Save Address',
              onPressed: () => onSavePressed(context),
              color: AppColors.primaryOrangeColor,
            ),
          ],
        ),
      ),
    );
  }

  void onSavePressed(BuildContext context) async {
    final cubit = context.read<ShippingAddressCubit>();
    final isUpdate = cubit.contentModel != null;
    final userId = await SharedPrefHelper.getInt(SharedPrefKeys.userId);

    if (cubit.formKey.currentState?.validate() == true) {
      cubit.createOrUpdateAddress(userId: userId, isUpdate: isUpdate);
    }
  }
}
