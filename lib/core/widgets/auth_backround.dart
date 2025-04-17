import 'package:flutter/material.dart';

class AuthBackround extends StatelessWidget {
  const AuthBackround({super.key});

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [ Positioned(
            left: screenWidth * 0,
            top: screenHeight * 0,
            child: Image.asset(
              "assets/images/Rectangle3.png",
              height: screenHeight * 0.15,
              width: screenWidth * 0.2,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: screenWidth * 0.23,
            top: screenHeight * 0.0,
            child: Image.asset(
              "assets/images/Rectangle13.png",
              height: screenHeight * 0.2,
              width: screenWidth * 0.55,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: screenWidth * 0,
            top: screenHeight * 0,
            child: Image.asset(
              "assets/images/Rectangle6.png",
              height: screenHeight * 0.15,
              width: screenWidth * 0.2,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 0,
            top: screenHeight * 0.16,
            child: Image.asset(
              "assets/images/Rectangle1.png",
              width: screenWidth * 0.2,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: screenWidth * 0,
            top: screenHeight * 0.16,
            child: Image.asset(
              "assets/images/Rectangle4.png",
              width: screenWidth * 0.2,
              fit: BoxFit.fill,
            ),
          ),],
    );
  }
}