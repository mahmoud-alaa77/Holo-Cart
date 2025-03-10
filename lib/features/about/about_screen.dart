import 'package:flutter/material.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "About Holo Cart",
            style: AppTextStyles.font18W600,
          )
        ],
      ),
    );
  }
}
