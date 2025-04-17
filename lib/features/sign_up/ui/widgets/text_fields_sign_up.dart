import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/core/helper/app_regex.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/widgets/auth_textfield.dart';
import 'package:holo_cart/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:holo_cart/features/sign_up/ui/widgets/password_vaildation.dart';

class TextFieldsSignUp extends StatefulWidget {
  const TextFieldsSignUp({super.key});

  @override
  State<TextFieldsSignUp> createState() => _TextFieldsSignUpState();
}

class _TextFieldsSignUpState extends State<TextFieldsSignUp> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
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
            controller: context.read<SignUpCubit>().fullName,
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
            controller: context.read<SignUpCubit>().userName,
            hintText: "Enter User Name",
          ),
          verticalSpace(10),
          AuthTextfield(
            hintText: "Enter Email",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            controller: context.read<SignUpCubit>().emailController,
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
            controller: context.read<SignUpCubit>().phoneNumber,
            hintText: "Enter Phone Number",
            keyboardType: TextInputType.phone,
            maxLength: 11,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11),
            ],
          ),
          verticalSpace(10),
          AuthTextfield(
            controller: context.read<SignUpCubit>().passwordController,
            hintText: 'Enter Password',
            obscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          verticalSpace(10),
          AuthTextfield(
            obscureText: true,
            controller:
                context.read<SignUpCubit>().passwordConfirmationController,
            hintText: "Confirm Password",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          verticalSpace(10),
          PasswordVaildation(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            minLenght: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
