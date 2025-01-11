import 'package:flutter/cupertino.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/widgets/auth_textfield.dart';

class TextFieldsSignUp extends StatelessWidget {
  const TextFieldsSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(25),
        const AuthTextfield(
          hintText: "Enter User Name",
        ),
        verticalSpace(10),
        const AuthTextfield(
          hintText: "Enter Email",
          
        ),
        verticalSpace(10),const AuthTextfield(
          hintText: "Enter Password",
          suffixIcon: Icon(
            CupertinoIcons.eye,
            color: AppColors.customLightGrayColor,
          ),
        ),
        verticalSpace(10),const AuthTextfield(
          hintText: "Confirm Password",
          suffixIcon: Icon(
            CupertinoIcons.eye,
            color: AppColors.customLightGrayColor,
          ),
        ),
        verticalSpace(10)
      ],
    );
  }
}
