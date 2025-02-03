import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/home/ui/widgets/category_circle_item.dart';
import 'package:holo_cart/features/home/ui/widgets/offers_widgets.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(24.r),
                  bottomStart: Radius.circular(24.r),
                )),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
                  child: Row(
                    children: [
                      Text(
                        'Holo Cart',
                        style: AppTextStyles.font24W900,
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: 30.r,
                          )),
                      Stack(children: [
                        IconButton(
                          icon: Icon(
                            Icons.notifications_none,
                            size: 30.r,
                          ),
                          onPressed: () {},
                        ),
                        Positioned(
                          right: 0,
                          child: Image.asset(
                            "assets/icons/red_point.png",
                            width: 35.w,
                            height: 35.h,
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
                const OffersWidget(),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
                  child: Row(
                    children: [
                      Text(
                        "Categories",
                        style: AppTextStyles.font22W900,
                      ),
                      const Spacer(),
                      TextButton(
                        child: Text(
                          "see all",
                          style: AppTextStyles.font13W400,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100.h,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryCircleItem(
                        index: index,
                        title: categories[index],
                      );
                    },
                  ),
                ),
                verticalSpace(8.h)
              ],
            ),
          ),
          verticalSpace(8.h),
          Container(
            height: 1000.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(24.r),
                  topStart: Radius.circular(24.r),
                )),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
                  child: Row(
                    children: [
                      Text(
                        "Best sellers",
                        style: AppTextStyles.font22W900,
                      ),
                      const Spacer(),
                      TextButton(
                        child: Text(
                          "see all",
                          style: AppTextStyles.font13W400,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
