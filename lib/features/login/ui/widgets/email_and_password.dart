import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/widgets/auth_textfield.dart';
import 'package:holo_cart/features/login/logic/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          verticalSpace(25),
           AuthTextfield(
              controller: context.read<LoginCubit>().userNameController,
                        hintText: "Enter User Name or Email",
                      ),
                      verticalSpace(15),
                       
                       AuthTextfield(
                    controller: context.read<LoginCubit>().passwordController,
                validator: (data) {
                  if (data == null || data.isEmpty) {
                    return 'Please enter a valid password';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText
                          ? CupertinoIcons.eye
                          
                          : CupertinoIcons.eye_slash,
                      size: 24,
                      color: AppColors.customLightGrayColor,
                    )),
                        hintText: "Enter Password",
                       
                      ),
                       verticalSpace(10)
        ],
      ),
    );
  }
}