import 'package:flutter/material.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/features/on_boarding/ui/widgets/lower_body.dart';
import 'package:holo_cart/features/on_boarding/ui/widgets/upper_body.dart';

class OnBoardingBody extends StatelessWidget {
  final String imageUrl;
  final Color outerColor;
  final Color innerColor;
  final String title;
  final String subTitle;
  final Color buttonColor;
  final Color buttonBackgroundColor;
  final void Function()? onTap;
  final bool isLast;

  const OnBoardingBody(
      {super.key,
      required this.imageUrl,
      required this.outerColor,
      required this.innerColor,
      required this.title,
      required this.subTitle,
      required this.buttonColor,
      required this.buttonBackgroundColor,
      this.onTap,
      required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: UpperBody(
              imageUrl: imageUrl,
              outerColor: outerColor,
              innerColor: innerColor),
        ),
        verticalSpace(12),
        LowerBody(
          isLast: isLast,
          title: title,
          subTitle: subTitle,
          buttonColor: buttonColor,
          buttonBackgroundColor: buttonBackgroundColor,
          onTap: onTap,
        ),
        verticalSpace(16),
      ],
    );
  }
}
