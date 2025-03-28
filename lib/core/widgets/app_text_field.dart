import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final String labelText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final Color? backgroundColor;
  final InputBorder? focusedBorder;
  final bool? obscureText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Function(String?) validator;
  final int? maxLines;
  final String? counterText;
  final bool? readOnly;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  const AppTextFormField({
    super.key,
    this.suffixIcon,
    this.labelStyle,
    required this.labelText,
    this.contentPadding,
    this.backgroundColor,
    this.enabledBorder,
    this.focusedBorder,
    this.obscureText,
    this.controller,
    this.prefixIcon,
    required this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.counterText,
    this.onChanged,
    this.readOnly,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly ?? false,
      maxLines: maxLines,
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        counterText: counterText,
        label: Text(labelText),
        errorStyle: AppTextStyles.font12W400.copyWith(color: Colors.red),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: .2,
              color: Colors.grey,
            )),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: .2,
              color: Colors.grey,
            )),
        labelStyle: labelStyle ?? AppTextStyles.font12W400,
        contentPadding: contentPadding ??
            EdgeInsetsDirectional.symmetric(vertical: 20.h, horizontal: 18.w),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: enabledBorder ??
            const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: .2,
                  color: Colors.grey,
                )),
        focusedBorder: focusedBorder ??
            const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: .5,
                )),
        fillColor: backgroundColor ?? Colors.white.withValues(alpha: .8),
        filled: true,
      ),
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: AppColors.primaryOrangeColor,
    );
  }
}
