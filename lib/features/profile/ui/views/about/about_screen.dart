import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  final String aboutText =
      "Shoppe - Shopping UI kit is likely a user interface (UI) kit designed to facilitate the development of e-commerce or shopping-related applications. UI kits are collections of pre-designed elements, components, and templates that developers and designers can use to create consistent and visually appealing user interfaces.";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "About Holo Cart",
            style: AppTextStyles.font20W700,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/holo_logo.png",
                    height: 120.h,
                  )),
              Text(
                aboutText,
                style: AppTextStyles.font16W500
                    .copyWith(color: AppColors.customLightGrayColor),
              ),
              verticalSpace(48),
              Text(
                "If you need help or you have any questions, feel free to contact me by email.",
                style: AppTextStyles.font16W500
                    .copyWith(color: AppColors.customLightGrayColor),
              ),
              verticalSpace(30),
              Text(
                "hello@mydomain.com",
                style: AppTextStyles.font18W600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
