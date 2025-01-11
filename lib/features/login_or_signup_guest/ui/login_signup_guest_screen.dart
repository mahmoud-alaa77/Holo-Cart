import 'package:flutter/material.dart';

import 'package:holo_cart/features/login_or_signup_guest/ui/widget/auth_items.dart';

class LoginORSignupORGuestScreen extends StatelessWidget {
  const LoginORSignupORGuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.grey,
                  Colors.white,
                ],
              ),
            ),
          ),
          Positioned(
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

          //4
          
          Positioned(
            left: 0,
            top: screenHeight * 0.16,
            child: Image.asset(
              "assets/images/Rectangle1.png",
              width: screenWidth * 0.2,
              height:  screenHeight * 0.20,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: screenWidth * 0,
            top: screenHeight * 0.16,
            child: Image.asset(
              "assets/images/Rectangle4.png",
              width: screenWidth * 0.2,
               height:  screenHeight * 0.20,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: screenWidth * 0.23,
            top: screenHeight * 0.21,
            child: Image.asset(
              "assets/images/Rectangle11.png",
              height: screenHeight * 0.30,
              width: screenWidth * 0.55,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: screenWidth * 0,
            top: screenHeight * 0.37,
            child: Image.asset(
              "assets/images/Rectangle15.png",
              width: screenWidth * 0.2,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: screenWidth * 0,
            top: screenHeight * 0.37,
            child: Image.asset(
              "assets/images/Rectangle44.png",
              width: screenWidth * 0.2,
              
              fit: BoxFit.fill,
            ),
          ),
          AuthItems(screenWidth: screenWidth, screenHeight: screenHeight),
        ],
      ),
    );
    
  }
}


