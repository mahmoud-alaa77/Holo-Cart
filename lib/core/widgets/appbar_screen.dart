import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class AppbarScreen extends StatelessWidget {
  const AppbarScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon:  Icon(Icons.arrow_back_ios_new_rounded ,size: 25.sp,)),
             const Spacer(flex: 1,),
             horizontalSpace(18),
           Text(title,
              style:AppTextStyles.font24W600)
              ,
          const Spacer(flex: 2,)
        ],
      ),
    );
  }
}