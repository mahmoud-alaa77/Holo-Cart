import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
        //  Center(
        //   child: Lottie.asset("assets/images/loading.json"),
        // );

        Center(
            child: LoadingAnimationWidget.threeRotatingDots(
      color: AppColors.primaryOrangeColor,
      size: 80.r,
    ));
  }
}
