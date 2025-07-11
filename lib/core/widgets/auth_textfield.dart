import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthTextfield extends StatelessWidget {
  const AuthTextfield({
    super.key,
    required this.hintText,
    this.icon,
    this.obscureText,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.fillColor,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,  this.initialValue,
  });
final String? initialValue;
  final String hintText;
  final Icon? icon;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final int? maxLength;

  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
     

      
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText ?? false,
      validator: validator,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        counterText: "", // لإخفاء عداد الحروف
        fillColor: fillColor ?? const Color.fromARGB(255, 255, 255, 255),
        filled: true,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
        prefixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
