import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/widgets/auth_textfield.dart';

class UpdateProfileTextFileds extends StatelessWidget {
  const UpdateProfileTextFileds({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          verticalSpace(25),
          AuthTextfield(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
              return null;
            },
            hintText: "Enter Full Name",
          ),
          verticalSpace(10),
          AuthTextfield(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
              return null;
            },
            hintText: "Enter User Name",
          ),
          verticalSpace(10),
          AuthTextfield(
            validator: (value) {
              if (value == null || value.isEmpty) {
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
