import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/features/on_boarding/ui/widgets/custom_indicator.dart';
import 'package:holo_cart/features/on_boarding/ui/widgets/on_boarding_body.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int index = 0;
  PageController? controller = PageController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return SafeArea(
        child: Scaffold(
      //backgroundColor: onBoardingScreenColor(index),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: onBoardingScreenColor(index),
            width: double.infinity,
            height: double.infinity,
          ),
          PageView(
            controller: controller,
            onPageChanged: (value) {
              setState(() {});
              index = value;
            },
            children: [
              OnBoardingBody(
                imageUrl: "assets/images/onboard1.json",
                outerColor: const Color(0xffFB8D3F),
                //innerColor: const Color(0xffF67F31),
                scale: .8,
                title: "Choose Your Product",
                subTitle:
                    "Find the perfect match for your needs and you can view it in 3D inside the holo cart store and provides 3D products ",
                buttonBackgroundColor: onBoardingScreenColor(index),
                buttonColor: onBoardingScreenColor(index + 1),
                isLast: false,
                onTap: () {
                  setState(() {});
                  controller?.animateToPage(index + 1,
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.linearToEaseOut);
                },
              ),
              OnBoardingBody(
                imageUrl: "assets/images/payment.json",
                outerColor: const Color(0xffFDC347),
                // innerColor: const Color(0xffFAD051),
                scale: .95,
                title: "Choose Payment Method",
                subTitle:
                    "Choose the payment method that suits you to complete your order quickly, easily, safely and comfortably.",
                buttonBackgroundColor: onBoardingScreenColor(index),
                buttonColor: onBoardingScreenColor(index + 1),
                isLast: false,
                onTap: () {
                  setState(() {});
                  controller?.animateToPage(index + 1,
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.linearToEaseOut);
                },
              ),
              OnBoardingBody(
                imageUrl: "assets/images/order.json",
                outerColor: const Color(0xff58D6CE),
                //innerColor: const Color(0xff6BE9E1),
                title: "Get Order On Time",
                scale: .95,
                subTitle:
                    "Ensure your order arrives on time with our fast delivery services and We work hard to ensure your order arrives on time and in the best condition. ",
                buttonBackgroundColor: onBoardingScreenColor(index),
                buttonColor: onBoardingScreenColor(index + 1),
                isLast: false,
                onTap: () {
                  setState(() {});
                  controller?.animateToPage(index + 1,
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.linearToEaseOut);
                },
              ),
              OnBoardingBody(
                imageUrl: "assets/images/offer.json",
                outerColor: const Color(0xff908DFE),
                scale: .95,
                // innerColor: const Color(0xff8280FF),
                title: "Get The Best Offers",
                subTitle:
                    "Enjoy the best offers and discounts on your favorite products. Take advantage of the exceptional offers now and achieve the greatest savings.",
                buttonBackgroundColor: onBoardingScreenColor(index),
                buttonColor: Colors.white,
                isLast: true,
                onTap: () async {
                  await SharedPrefHelper.setBool('onBoardingFinished', true);

                  GoRouter.of(context).go(AppRoutes.mainAuth);
                },
              ),
            ],
          ),
          Positioned(
              top: screenHeight / 1.66,
              right: screenWidth / 2.5,
              child: Row(
                children: [
                  CustomIndicator(active: index == 0),
                  CustomIndicator(active: index == 1),
                  CustomIndicator(active: index == 2),
                  CustomIndicator(active: index == 3),
                ],
              )),
        ],
      ),
    ));
  }
}

Color onBoardingScreenColor(int index) {
  if (index == 0) {
    return AppColors.primaryOrangeColor;
  } else if (index == 1) {
    return AppColors.customYellowColor;
  } else if (index == 2) {
    return AppColors.customGreenColor;
  } else {
    return AppColors.customPurpleColor;
  }
}
