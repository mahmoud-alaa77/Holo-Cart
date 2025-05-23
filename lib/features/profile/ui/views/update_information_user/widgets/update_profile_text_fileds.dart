import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/widgets/auth_textfield.dart';
import 'package:holo_cart/features/profile/logic/update_profile/update_profile_cubit.dart';

class UpdateProfileTextFileds extends StatelessWidget {
  const UpdateProfileTextFileds({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdateProfileCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          verticalSpace(25),
          AuthTextfield(
            controller: cubit.fullNameController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a valid full name';
              }
              return null;
            },
            hintText: "Enter Full Name",
          ),
          verticalSpace(10),
          AuthTextfield(
            controller: cubit.userNameController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a valid user name';
              }
              return null;
            },
            hintText: "Enter User Name",
          ),verticalSpace(10),
          AuthTextfield(
            controller: cubit.addressController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
            
            hintText: "Enter Address",
          ),

          verticalSpace(10),
          AuthTextfield(
            controller: cubit.phoneController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your phone number';
              }
              if (value.length != 11) {
                return 'Phone number must be exactly 11 digits';
              }
              return null;
            },
            hintText: "Enter Phone Number",
            keyboardType: TextInputType.phone,
            maxLength: 11,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11),
            ],
          ),
        ],
      ),
    );
  }
}
