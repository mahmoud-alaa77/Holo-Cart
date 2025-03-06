import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class FavouritCartItem extends StatelessWidget {
  const FavouritCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.productDetails);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.customBlackColor.withValues(alpha: .5)
                    : const Color.fromARGB(255, 241, 239, 239),
          boxShadow:[
      BoxShadow(
        color: Colors.black.withGreen(DateTime.august), 
        blurRadius: 3.r, 
       
        offset: Offset(0, 3), 
      ),
    ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                    child: Image.asset(
                      "assets/images/phone.png",
                      
                      
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                  
                      child:const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        
                      ),
                    ),
                  
                ],
              ),
            ),
            verticalSpace(8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
             
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [  Text(
                "iPhone 16 Plus",
                style: AppTextStyles.font14W600,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpace(5),
              Text(
                "12,000\$",
                style: AppTextStyles.font12W700,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),],
            ),
          )
          ],
        ),
      ),
    );
  }
}
