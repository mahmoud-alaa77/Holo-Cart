


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIndicator extends StatelessWidget {
  final bool active;
  const CustomIndicator({super.key, required this.active,});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return AnimatedContainer(
      width: active ? screenWidth * 0.07 : screenWidth * .03,
      height: screenHeight * .01,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 2.r),
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(50),
          color: active ? Colors.white : Colors.white.withValues(alpha: .3)),
    );
  }
}