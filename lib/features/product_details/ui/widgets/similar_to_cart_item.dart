import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

class  SimilarToCartItem extends StatelessWidget {
  const  SimilarToCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.productDetails);
      },
      child: Container( 
        
       
        margin: EdgeInsets.symmetric(horizontal: 6.w,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color:Theme.of(context).brightness == Brightness.dark
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
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: Image.asset(
                "assets/images/phone.png",
                 width: 140.w,
        height: 130.h,
                
                
                fit: BoxFit.fill,
              ),
            ),
           
            verticalSpace(8),
            Text(
              "iPhone 16 Plus",
              style: AppTextStyles.font14W600,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            
            Row(
              
              
              children: [
                Text(
                  "12,000\$",
                  style: AppTextStyles.font12W700,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                horizontalSpace(48),
                IconButton(onPressed: () {
                  
                },icon: Icon(
                  Icons.favorite_border_sharp,)
                  
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}