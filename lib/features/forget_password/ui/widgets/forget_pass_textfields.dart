import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/app_regex.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/auth_textfield.dart';
import 'package:holo_cart/features/forget_password/logic/cubit/forget_password_cubit.dart';

import '../../../../core/themes/app_colors.dart';

class ForgetPassTextfields extends StatelessWidget {
  const ForgetPassTextfields({
    super.key,
    
  });

 

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgetPasswordCubit>().formKey,
      child: Column(
        children: [
          Image.asset("assets/images/forget_pass.png",height: 0.27.sh,),
          verticalSpace(5),
          Text("Forget Password",
              style: AppTextStyles.font36W500),
          Text(
              "We send you a code to the Email you Enter to Reset password",
              textAlign: TextAlign.center,
              style: AppTextStyles.font14W500.copyWith(
                color: AppColors.customWhiteColor,
              )),
          verticalSpace(15),
           AuthTextfield(hintText: "Enter Email Address",validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              controller: context.read<ForgetPasswordCubit>().emailController,),
          verticalSpace(20),
         
        ],
      ),
    );
  }
}
