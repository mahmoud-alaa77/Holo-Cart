import 'package:flutter/material.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const CustomProgressIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        
        final bool isActive = index == currentStep;
        
        final Color indicatorColor = isActive 
            ? Colors.white  
            : AppColors.customLightColor .withAlpha(100);  
            
        
        final double size = isActive ? 10.0 : 7.0; 
            
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: indicatorColor,
            ),
          ),
        );
      }),
    );
  }
}