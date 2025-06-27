import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/display_shipping_address/get_address_response_model.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/creat_shipping_address/shipping_address_cubit.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/get_shipping_address/get_shipping_address_cubit.dart';
import 'widgets/address_text_fields.dart';

class EditAndCreateAddressScreen extends StatefulWidget {
  final bool isEdit;
  final ShippingAddressContentModel? content;
  final GetShippingAddressCubit getCubit;
  
  const EditAndCreateAddressScreen({
    super.key, 
    required this.isEdit, 
    this.content, 
    required this.getCubit
  });

  @override
  State<EditAndCreateAddressScreen> createState() => _EditAndCreateAddressScreenState();
}

class _EditAndCreateAddressScreenState extends State<EditAndCreateAddressScreen> {
  @override
  void initState() {
    super.initState();
    // تحميل البيانات الأولية إذا كان في وضع التعديل
    if (widget.isEdit && widget.content != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<ShippingAddressCubit>().loadInitialData(widget.content);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEdit ? 'Edit Address' : 'Add Address',
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
                    barrierDismissible: false, // منع إغلاق الـ dialog بالضغط خارجه
                    builder: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is ShippingAddressSuccess) {
                  // إغلاق اللودينج dialog
                  Navigator.of(context, rootNavigator: true).pop();
                  
                  // تحديث قائمة العناوين
                  widget.getCubit.refreshShippingAddresses();
                  
                  // إغلاق الصفحة والعودة للصفحة السابقة
                  Navigator.pop(context, true);

                  // إظهار رسالة النجاح
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        widget.isEdit 
                          ? 'Address updated successfully!' 
                          : 'Address created successfully!'
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is ShippingAddressFailure) {
                  // إغلاق اللودينج dialog
                  Navigator.of(context, rootNavigator: true).pop();
                  
                  // إظهار رسالة الخطأ
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const SizedBox.shrink(),
            ),
            const SizedBox(height: 20),
            ButtonItem(
              text: widget.isEdit ? 'Update Address' : 'Save Address',
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
    
    // التحقق من صحة النموذج أولاً
    if (cubit.formKey.currentState?.validate() != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all required fields correctly'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    try {
      // جلب الـ userId
      final userId = await SharedPrefHelper.getInt(SharedPrefKeys.userId);
      
      // التحقق من صحة userId
      if (userId == 0 || userId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User ID not found. Please login again.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // تحديد ما إذا كان في وضع التحديث
      final isUpdate = widget.isEdit && widget.content != null;
      
      // استدعاء العملية
      cubit.createOrUpdateAddress(userId: userId, isUpdate: isUpdate);
      
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}