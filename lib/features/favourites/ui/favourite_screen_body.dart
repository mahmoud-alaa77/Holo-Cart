import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';

import 'package:holo_cart/core/themes/app_text_styles.dart';

import 'widgets/favourite_cart_item.dart';

class FavouriteScreenBody extends StatelessWidget {
  const FavouriteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Padding(
        padding: EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("My Favourites(12) ", style: AppTextStyles.font24W800),
              verticalSpace(30),
              GridView.builder(
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.6, 
                ),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return FavouritCartItem();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

