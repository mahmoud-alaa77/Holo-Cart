import 'package:flutter/material.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:lottie/lottie.dart';

class GuestWidget extends StatelessWidget {
  const GuestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset("assets/images/profileGuest.json", height: 150),
        verticalSpace(10),
        const Text(
          "Welcome, Guest!",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpace(8),
        const Text(
          "Sign in to access your profile, favorites, and more.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        
      ],
    );
  }
}
