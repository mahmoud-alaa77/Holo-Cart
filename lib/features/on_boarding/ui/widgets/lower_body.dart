import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class LowerBody extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color buttonColor;
  final Color buttonBackgroundColor;
  final void Function()? onTap;
  final bool isLast ;
  const LowerBody(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.buttonColor,
      required this.buttonBackgroundColor,
      this.onTap, required this.isLast});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: screenHeight / 3.3,
      child: Stack(children: [
        Container(
          width: screenWidth,
          height: screenHeight / 4,
          margin: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
          padding: EdgeInsetsDirectional.all(12.r),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.2),
              borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            children: [
              Text(
                title,
                style: AppTextStyles.font26W900,
              ),
              verticalSpace(4),
              Text(
                subTitle,
                style: AppTextStyles.font15W400,
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            right: screenWidth / 2 - 35.w,
            child: GestureDetector(
              onTap: onTap,
              child: CircleAvatar(
                  radius: 38.r,
                  backgroundColor: buttonBackgroundColor,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    width: 65.w,
                    height: 65.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: buttonColor),
                    child:  Center(
                      child:isLast ? const Icon(Icons.done,color:Colors.green,size: 35,) : const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  )),
            )),
      ]),
    );
  }
}
