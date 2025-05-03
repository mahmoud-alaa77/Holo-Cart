import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class UpperBody extends StatelessWidget {
  final String imageUrl;
  final Color outerColor;
  final Color innerColor;
  final double? scale;
  const UpperBody(
      {super.key,
      required this.imageUrl,
      required this.outerColor,
      required this.innerColor,
      this.scale});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.only(top: 32.r),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CircleAvatar(
              radius: screenWidth / 2.3,
              backgroundColor: outerColor,
              child: CircleAvatar(
                  radius: screenWidth / 3, backgroundColor: innerColor)),
          Align(
            alignment: AlignmentDirectional.center,
            child: ScaleTransition(
              scale: AlwaysStoppedAnimation(scale ?? 1),
              child: Lottie.asset(
                imageUrl,
                width: screenWidth - 60.w,
              ),
            ),
          )
        ],
      ),
    );
  }
}
