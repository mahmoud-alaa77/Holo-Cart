import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:lottie/lottie.dart';

class Emptyitem extends StatelessWidget {
  const Emptyitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset("assets/images/empty.json",width: 250.w, height: 250.h),
        verticalSpace(15),
        Text(
          "No Shipping Address Created Yet",
          textAlign: TextAlign.center,
          style: TextStyle(
            
            fontSize: 22.sp,
            fontWeight: FontWeight.w500,
            
          ),
        ),
      ],

    );
  }
}