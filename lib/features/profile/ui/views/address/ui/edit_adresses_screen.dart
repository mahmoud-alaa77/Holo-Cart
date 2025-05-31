import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/widgets/auth_textfield.dart';
import 'package:holo_cart/core/widgets/button_item.dart';

class EditAddressScreen extends StatelessWidget {
  final TextEditingController? controller;

  const EditAddressScreen({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Address',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AuthTextfield(
              controller: controller,
              hintText: 'Street Address1',
              fillColor: Colors.grey[200],
            ),
            verticalSpace(12),
            AuthTextfield(
              controller: controller,
              hintText: 'Street Address2',
              fillColor: Colors.grey[200],
            ),
            verticalSpace(12),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        onSelect: (Country country) {},
                      );
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select Country',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Icon(Icons.arrow_drop_down, color: Colors.black54),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AuthTextfield(
                    hintText: 'City',
                    fillColor: Colors.grey[200],
                  ),
                ),
              ],
            ),
            verticalSpace(12),
            Row(
              children: [
                Expanded(
                  child: AuthTextfield(
                    hintText: 'State',
                    fillColor: Colors.grey[200],
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: AuthTextfield(
                    hintText: 'Zip Code',
                    fillColor: Colors.grey[200],
                  ),
                ),
              ],
            ),
            verticalSpace(24),
            ButtonItem(
              text: 'Save',
              onPressed: () {
                Navigator.pop(context);
              },
              color: AppColors.primaryOrangeColor,
            ),
          ],
        ),
      ),
    );
  }
}
