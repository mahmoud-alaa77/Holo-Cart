import 'package:flutter/material.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
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
                imageUrl: "assets/images/onBoarding1.png",
                outerColor: const Color(0xffFB8D3F),
                innerColor: const Color(0xffF67F31),
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
                imageUrl: "assets/images/onBoarding2.png",
                outerColor: const Color(0xffFDC347),
                innerColor: const Color(0xffFAD051),
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
                imageUrl: "assets/images/onBoarding3.png",
                outerColor: const Color(0xff58D6CE),
                innerColor: const Color(0xff6BE9E1),
                title: "Get Order On Time",
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
                imageUrl: "assets/images/onBoarding4.png",
                outerColor: const Color(0xff908DFE),
                innerColor: const Color(0xff8280FF),
                title: "Get The Best Offers",
                subTitle:
                    "Enjoy the best offers and discounts on your favorite products. Take advantage of the exceptional offers now and achieve the greatest savings.",
                buttonBackgroundColor: onBoardingScreenColor(index),
                buttonColor: Colors.white,
                isLast: true,
              ),
            ],
          ),
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



