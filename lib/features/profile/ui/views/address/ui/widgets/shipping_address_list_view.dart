import 'package:flutter/material.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/display_shipping_address/get_address_response_model.dart';
import 'package:holo_cart/features/profile/ui/views/address/ui/edit_adresses_screen.dart';

class ShippingAddressListView extends StatelessWidget {
  const ShippingAddressListView({
    super.key, this.addressResponseModel,
  });
  final GetAddressResponseModel? addressResponseModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addressResponseModel?.data.length ?? 0,
      itemBuilder: (context, index) {
        return Container(
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
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 1.0, 
                      ),
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  child: Text(
                    ' ${addressResponseModel?.data[index].addressLine1 ?? 'No Address'}',
                    style: AppTextStyles.font16W500
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditAddressScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
