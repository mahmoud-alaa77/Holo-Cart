import 'package:flutter/material.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/auth_textfield.dart';


class ResetTextFields extends StatelessWidget {
  const ResetTextFields({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/reset.png",height: screenHeight*0.3),
        verticalSpace(5),
        Text("Reset Password",
            style: AppTextStyles.font36W500),
            verticalSpace(10),
       
        const AuthTextfield(hintText: "Password"),
        verticalSpace(10),
        const AuthTextfield(hintText: "Confirm Password" , obscureText: true,),
        verticalSpace(30),
       
      ],
    );
  }}