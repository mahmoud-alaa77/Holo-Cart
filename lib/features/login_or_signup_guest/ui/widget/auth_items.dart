import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/login_or_signup_guest/ui/widget/guest_item.dart';

class AuthItems extends StatelessWidget {
  const AuthItems({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -300.h,
      child: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          color: AppColors.primaryOrangeColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/bag.png",
                width: 90,
                height: 70,
              ),
              Text(
                "Welcome\n To Holo Cart",
                textAlign: TextAlign.center,
                style: AppTextStyles.font36W400.copyWith(
                  color: AppColors.customBlackColor,
                  shadows: [
                    Shadow(
                      color: const Color.fromARGB(255, 8, 8, 8)
                          .withValues(alpha: 20),
                      offset:const Offset(0, 0),
                      blurRadius: 7,
                    ),
                  ],
                ),
              ),
              
              Text(
                "Sign up and discover a great amount of new opportunities!",
                textAlign: TextAlign.center,
                style: AppTextStyles.font13W400
                    .copyWith(color: AppColors.customBlackColor),
              ),
              verticalSpace(20),
              ButtonItem(text: "Login", onPressed: () {
                GoRouter.of(context).push('/login');
              }),
              verticalSpace(12),
              ButtonItem(text: "Sign up", onPressed: () {
                GoRouter.of(context).push(AppRoutes.signUp);
              }),
             const GuestItem(),
            ],
          ),
        ),
      ),
    );
  }
}