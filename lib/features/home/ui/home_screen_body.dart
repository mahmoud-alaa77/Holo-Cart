import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/categories/ui/widgets/category_cart_item.dart';
import 'package:holo_cart/features/dark_and_light_mode/app_states.dart';
import 'package:holo_cart/features/dark_and_light_mode/cubit/app_mode_cubit.dart';
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
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.customBlackColor.withValues(alpha: .5)
                    : Colors.white,
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
                      Image.asset(
                        "assets/images/holo_logo.png",
                        width: 130.w,
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: 30.r,
                          )),
                      BlocBuilder<AppModeCubit, AppModeState>(
                        builder: (context, state) {
                          final isLightMode = state is AppModeLight;
                          return IconButton(
                              onPressed: () {
                                final newThemeState = isLightMode
                                    ? ThemeState.dark
                                    : ThemeState.light;
                                context
                                    .read<AppModeCubit>()
                                    .changeAppMode(newThemeState);
                              },
                              icon: Icon(
                                isLightMode
                                    ? Icons.dark_mode
                                    : Icons.light_mode,
                                size: 30.r,
                                color: isLightMode
                                    ? Colors.black
                                    : AppColors.customYellowColor,
                              ));
                        },
                      ),
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
                          style: AppTextStyles.font13W400
                              .copyWith(color: AppColors.primaryOrangeColor),
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
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.customBlackColor.withValues(alpha: .5)
                    : Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(24.r),
                  topStart: Radius.circular(24.r),
                )),
            // child:
            //  Column(
            //   children: [
            //     Padding(
            //       padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
            //       child: Row(
            //         children: [
            //           Text(
            //             "Best sellers",
            //             style: AppTextStyles.font22W900,
            //           ),
            //           const Spacer(),
            //           TextButton(
            //             child: Text(
            //               "see all",
            //               style: AppTextStyles.font13W400,
            //             ),
            //             onPressed: () {},
            //           )
            //         ],
            //       ),
            //     ),
            //     verticalSpace(8),
            //     GridView.builder(
            //       shrinkWrap: true,
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemCount: categories.length - 12,
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2,
            //           childAspectRatio: .75,
            //           crossAxisSpacing: 2,
            //           mainAxisSpacing: 2),
            //       itemBuilder: (context, index) {
            //         return CategoryCartItem(
            //           categoryName: categories[index],
            //         );
            //       },
            //     ),
            //     verticalSpace(8),
            //     // ListView.builder(
            //     //   itemCount: 12,
            //     //   scrollDirection: Axis.horizontal,
            //     //   itemBuilder: (context, index) {
            //     //     return const CategoryCartItem(
            //     //       categoryName: "Category",
            //     //     );
            //     //   },
            //     // ),
            //     Padding(
            //       padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
            //       child: Row(
            //         children: [
            //           Text(
            //             "Popular ",
            //             style: AppTextStyles.font22W900,
            //           ),
            //           const Spacer(),
            //           TextButton(
            //             child: Text(
            //               "see all",
            //               style: AppTextStyles.font13W400,
            //             ),
            //             onPressed: () {},
            //           )
            //         ],
            //       ),
            //     ),
            //     verticalSpace(8),
            //     // GridView.builder(
            //     //   shrinkWrap: true,
            //     //   physics: const NeverScrollableScrollPhysics(),
            //     //   itemCount: categories.length - 12,
            //     //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     //       crossAxisCount: 2,
            //     //       childAspectRatio: .75,
            //     //       crossAxisSpacing: 2,
            //     //       mainAxisSpacing: 2),
            //     //   itemBuilder: (context, index) {
            //     //     return CategoryCartItem(
            //     //       categoryName: categories[index],
            //     //     );
            //     //   },
            //     // ),
            //     verticalSpace(70)
            //   ],
            // ),
          )
        ],
      ),
    );
  }
}
