import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/widgets/auth_textfield.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/creat_shipping_address/shipping_address_cubit.dart';

class AddressTextFields extends StatelessWidget {
  const AddressTextFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ShippingAddressCubit>().formKey,
      child: Column(
        children: [
          AuthTextfield(
            controller: context.read<ShippingAddressCubit>().address1Controller,
            hintText: 'Street Address1',
            fillColor: Colors.grey[200],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the street address';
              }
              return null;
            },
          ),
          verticalSpace(12),
          AuthTextfield(
            controller: context.read<ShippingAddressCubit>().address2Controller,
            hintText: 'Street Address2',
            fillColor: Colors.grey[200],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the second address line';
              }
              return null;
            },
          ),
          verticalSpace(12),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      onSelect: (Country country) {
                        context
                            .read<ShippingAddressCubit>()
                            .countryController
                            .text = country.name;
                      },
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
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          context
                                  .watch<ShippingAddressCubit>()
                                  .countryController
                                  .text
                                  .isNotEmpty
                              ? context
                                  .watch<ShippingAddressCubit>()
                                  .countryController
                                  .text
                              : 'Select Country',
                          style: const TextStyle(color: Colors.black54),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: AuthTextfield(
                  controller:
                      context.read<ShippingAddressCubit>().cityController,
                  hintText: 'City',
                  fillColor: Colors.grey[200],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          verticalSpace(12),
          Row(
            children: [
              Expanded(
                child: AuthTextfield(
                  controller:
                      context.read<ShippingAddressCubit>().stateController,
                  hintText: 'State',
                  fillColor: Colors.grey[200],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your state';
                    }
                    return null;
                  },
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: AuthTextfield(
                  controller:
                      context.read<ShippingAddressCubit>().zipCodeController,
                  hintText: 'Zip Code',
                  fillColor: Colors.grey[200],
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 4) {
                      return 'Enter a valid ZIP code';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
