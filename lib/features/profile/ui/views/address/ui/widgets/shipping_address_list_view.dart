import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/display_shipping_address/get_address_response_model.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/get_shipping_address/get_shipping_address_cubit.dart';

class ShippingAddressListView extends StatefulWidget {
  const ShippingAddressListView({
    super.key,
    this.addressResponseModel,
  });

  final GetAddressResponseModel? addressResponseModel;

  @override
  State<ShippingAddressListView> createState() => _ShippingAddressListViewState();
}

class _ShippingAddressListViewState extends State<ShippingAddressListView> {
  int selectedIndex = 0; // أول عنصر مختار افتراضياً
  static const String _selectedAddressKey = 'selected_address_index';

  @override
  void initState() {
    super.initState();
    _loadSelectedAddress();
  }

  // تحميل آخر عنوان مختار من SharedPreferences
  Future<void> _loadSelectedAddress() async {
    final savedIndex = await SharedPrefHelper.getInt(_selectedAddressKey);
    if (mounted && widget.addressResponseModel?.data != null) {
      setState(() {
        // تأكد إن الـ index صحيح ومش أكبر من عدد العناوين
        if (savedIndex < widget.addressResponseModel!.data.length) {
          selectedIndex = savedIndex;
        } else {
          selectedIndex = 0; // لو الـ index مش صحيح، ارجع للأول
        }
      });
    }
  }

  // حفظ العنوان المختار في SharedPreferences
  Future<void> _saveSelectedAddress(int index) async {
    await SharedPrefHelper.saveDataByKey(_selectedAddressKey, index);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.addressResponseModel?.data.length ?? 0,
      itemBuilder: (context, index) {
        final isSelected = selectedIndex == index;
        
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
              // الدائرة الصغيرة للاختيار
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  // حفظ الاختيار في SharedPreferences
                  _saveSelectedAddress(index);
                },
                child: Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.grey,
                      width: 2,
                    ),
                    color: isSelected ? Colors.blue : Colors.transparent,
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 14,
                        )
                      : null,
                ),
              ),
              
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    // حفظ الاختيار في SharedPreferences
                    _saveSelectedAddress(index);
                  },
                  child: Container(
                    decoration: const BoxDecoration(),
                    padding: EdgeInsets.zero,
                    child: Text(
                        ' ${widget.addressResponseModel?.data[index].addressLine1 ?? 'No Address'}',
                        style: AppTextStyles.font16W500),
                  ),
                ),
              ),
              
              GestureDetector(
                onTap: () async {
                  final shouldRefresh = await GoRouter.of(context).push<bool>(
                    AppRoutes.addNewAddress,
                    extra: {
                      'content': widget.addressResponseModel!.data[index],
                      'isEdit': true,
                      'getCubit': context.read<GetShippingAddressCubit>(),
                    },
                  );

                  if (shouldRefresh == true) {
                    context.read<GetShippingAddressCubit>().fetchShippingAddress();
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
  
  // دالة للحصول على العنوان المختار حالياً
  int getSelectedAddressIndex() {
    return selectedIndex;
  }
  
  // دالة للحصول على العنوان المختار
  dynamic getSelectedAddress() {
    if (widget.addressResponseModel?.data != null && 
        selectedIndex < widget.addressResponseModel!.data.length) {
      return widget.addressResponseModel!.data[selectedIndex];
    }
    return null;
  }
}
