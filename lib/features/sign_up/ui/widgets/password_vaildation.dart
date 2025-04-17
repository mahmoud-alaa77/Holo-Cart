
import 'package:flutter/material.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class PasswordVaildation extends StatelessWidget {
  const PasswordVaildation(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
     
      required this.hasSpecialCharacters,
      required this.minLenght});

  final bool hasLowerCase;
  final bool hasUpperCase;
  
  final bool hasSpecialCharacters;
  final bool minLenght;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        const SizedBox(
          height: 3,
        ),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        const SizedBox(
          height: 3,
        ),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        
        const SizedBox(
          height: 3,
        ),
        buildValidationRow('At least 8 characters long', minLenght),
      ],
    );
  }
}

Widget buildValidationRow(String text, bool hasValidated) {
  return Row(
    children: [
      const CircleAvatar(
        radius: 2.5,
        backgroundColor: AppColors.customLightGrayColor,
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        text,
        style: AppTextStyles.font14W500.copyWith(
          decoration: hasValidated ? TextDecoration.lineThrough : null,
          decorationColor: Colors.black,
          decorationThickness: 2,
          color: hasValidated ? AppColors.customLightGrayColor : AppColors.customWhiteColor,
        ),
      )
    ],
  );
}
