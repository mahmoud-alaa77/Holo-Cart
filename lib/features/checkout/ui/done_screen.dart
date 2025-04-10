import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/button_item.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryOrangeColor,


      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(70),
          Expanded( child: Image.asset( 'assets/images/done.png')),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration:const BoxDecoration(
                color: AppColors.customLightColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Text(
                    "Order Placed Successfully",
                    style: AppTextStyles.font30W700,
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(15),
                   Text(
                    "You will recieve an email confirmation",
                    style: AppTextStyles.font16W400.copyWith(
                      color: AppColors.customLightGrayColor,

                    ),
                  ),
                  verticalSpace(40),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:  20.sp),
                    child: ButtonItem(text: "Finish", onPressed: () {
                      GoRouter.of(context).pushReplacement(AppRoutes.main);
                      
                    }, color: AppColors.primaryOrangeColor, radius: 30),
                  ),
                ],  
              
            ),
          )
      
          
         
      )],
      ),
    );
  }
}