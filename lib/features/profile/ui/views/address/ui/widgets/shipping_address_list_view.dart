import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
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
  State<ShippingAddressListView> createState() =>
      _ShippingAddressListViewState();
}

class _ShippingAddressListViewState extends State<ShippingAddressListView> {
  int selectedIndex = 0;
  static const String _selectedAddressKey = 'selected_address_index';

  @override
  void initState() {
    super.initState();
    _loadSelectedAddress();
  }

  Future<void> _loadSelectedAddress() async {
    final savedIndex = await SharedPrefHelper.getInt(_selectedAddressKey);
    if (mounted && widget.addressResponseModel?.data != null) {
      setState(() {
        if (savedIndex < widget.addressResponseModel!.data.length) {
          selectedIndex = savedIndex;
        } else {
          selectedIndex = 0;
        }
      });
    }
  }

  Future<void> _saveSelectedAddress(int index) async {
    await SharedPrefHelper.saveDataByKey(_selectedAddressKey, index);
  }

  // دالة عرض dialog التأكيد
  Future<bool> _showDeleteDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(200),
                      blurRadius: 20.sp,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: 30.sp,
                      ),
                    ),
                    verticalSpace(20),
                    Text(
                      'حذف العنوان',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3748),
                        height: 1.4.h,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'هل أنت متأكد من حذف هذا العنوان؟',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF718096),
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // إلغاء
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            height: 35.h,
                            decoration: BoxDecoration(
                              color: AppColors.customBlackColor,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: Center(
                              child: Text(
                                'إلغاء',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        horizontalSpace(12),

                        // حذف
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            height: 35.h,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'حذف',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.addressResponseModel?.data.length ?? 0,
      itemBuilder: (context, index) {
        final isSelected = selectedIndex == index;
        final addressData = widget.addressResponseModel?.data[index];

        return Dismissible(
          key: Key(
              'address_${addressData?.shippingAddressId ?? index}'), // استخدام ID فريد
          direction: DismissDirection.endToStart, // السحب من اليمين لليسار فقط
          confirmDismiss: (direction) async {
            // عرض dialog التأكيد
            final shouldDelete = await _showDeleteDialog(context);

            if (shouldDelete && addressData?.shippingAddressId != null) {
              // حذف العنوان من الخادم
              context
                  .read<GetShippingAddressCubit>()
                  .deleteShippingAddress(addressData!.shippingAddressId);

              // إذا كان العنوان المحذوف هو المختار، اختار أول عنوان
              if (selectedIndex == index &&
                  widget.addressResponseModel!.data.length > 1) {
                setState(() {
                  selectedIndex = 0;
                });
                _saveSelectedAddress(0);
              } else if (selectedIndex > index) {
                // إذا كان العنوان المختار بعد العنوان المحذوف، قلل الفهرس
                setState(() {
                  selectedIndex--;
                });
                _saveSelectedAddress(selectedIndex);
              }

              return true; // السماح بالحذف
            }

            return false; // عدم السماح بالحذف
          },
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 30,
            ),
          ),
          child: Container(
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
                      _saveSelectedAddress(index);
                    },
                    child: Container(
                      decoration: const BoxDecoration(),
                      padding: EdgeInsets.zero,
                      child: Text(
                          ' ${addressData?.addressLine1 ?? 'No Address'}',
                          style: AppTextStyles.font16W500),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () async {
                    final shouldRefresh = await GoRouter.of(context).push<bool>(
                      AppRoutes.addNewAddress,
                      extra: {
                        'content': addressData,
                        'isEdit': true,
                        'getCubit': context.read<GetShippingAddressCubit>(),
                      },
                    );

                    if (shouldRefresh == true) {
                      context
                          .read<GetShippingAddressCubit>()
                          .fetchShippingAddress();
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
          ),
        );
      },
    );
  }

  int getSelectedAddressIndex() {
    return selectedIndex;
  }

  dynamic getSelectedAddress() {
    if (widget.addressResponseModel?.data != null &&
        selectedIndex < widget.addressResponseModel!.data.length) {
      return widget.addressResponseModel!.data[selectedIndex];
    }
    return null;
  }
}
