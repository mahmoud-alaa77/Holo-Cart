import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class PaypalItem extends StatelessWidget {
  const PaypalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: double.infinity,

      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: 
        
        Row(
          children: [
            Text(
              "khaled@khaled.com" ,style: AppTextStyles.font15W500,
            ),
          ],
        ));
        
  }
}
