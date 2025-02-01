import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

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
                CarouselSlider.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 12.r),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: Image.asset(
                        "assets/images/slider1.png",
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    aspectRatio: 2,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                  ),
                ),
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
                      return Padding(
                        padding: EdgeInsetsDirectional.only(
                            top: 6.h,
                            bottom: 6.h,
                            start: index == 0 ? 0 : 8.h,
                            end: 8.h),
                        child: Column(
                          children: [
                            Container(
                              width: 50.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child:
                                  Image.asset("assets/images/onBoarding1.png"),
                            ),
                            verticalSpace(4),
                            Text(
                              categories[index],
                              style: AppTextStyles.font15W500,
                            ),
                          ],
                        ),
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
          )
        ],
      ),
    );
  }
}

List<String> categories = [
  "Fashion",
  "Beauty",
  "Electronics",
  "Home",
  "Kitchen",
  "Games",
  "Sports",
  "Travel",
  "Toys",
  "Health",
  "Automotive",
  "Beauty",
  "Electronics",
  "Home",
  "Kitchen",
  "Games",
  "Sports",
  "Travel",
  "Toys",
  "Health",
  "Automotive",
  "More"
];
