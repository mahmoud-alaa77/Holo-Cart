import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/shimmer_loading_contianer.dart';
import 'package:holo_cart/features/dark_and_light_mode/app_states.dart';
import 'package:holo_cart/features/dark_and_light_mode/cubit/app_mode_cubit.dart';
import 'package:holo_cart/features/home/logic/get_all_categories/get_categories_cubit.dart';
import 'package:holo_cart/features/home/ui/widgets/all_products_section/all_products_sectiom.dart';
import 'package:holo_cart/features/home/ui/widgets/category_circle_item.dart';
import 'package:holo_cart/features/home/ui/widgets/custom_home_divider_container.dart';
import 'package:holo_cart/features/home/ui/widgets/hot_sales_section/hot_sales_section.dart';
import 'package:holo_cart/features/home/ui/widgets/offers_widgets.dart';
import 'package:holo_cart/features/search/ui/search_screen.dart';
import 'package:lottie/lottie.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 16.r, vertical: 8.r),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/holo_logo.png",
                      width: 130.w,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const SearchScreen();
                          },
                        ));
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.customLightColor,
                        child: Icon(
                          Icons.search,
                          size: 30.r,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    horizontalSpace(8),
                    BlocBuilder<AppModeCubit, AppModeState>(
                      builder: (context, state) {
                        final isLightMode = state is AppModeLight;
                        return GestureDetector(
                            onTap: () {
                              final newThemeState = isLightMode
                                  ? ThemeState.dark
                                  : ThemeState.light;
                              context
                                  .read<AppModeCubit>()
                                  .changeAppMode(newThemeState);
                            },
                            child: Lottie.asset(
                              isLightMode
                                  ? "assets/images/dark.json"
                                  : "assets/images/light.json",
                              width: 43.r,
                              // color: isLightMode
                              //     ? Colors.black
                              //     : AppColors.customYellowColor,
                            ));
                      },
                    ),
                    horizontalSpace(8),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: AppColors.customLightColor,
                        child: Lottie.asset("assets/images/notifcations.json",
                            width: 45.w),
                      ),
                    )
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
              BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
                builder: (context, state) {
                  if (state is GetCategoriesSuccess) {
                    return SizedBox(
                      width: double.infinity,
                      height: 100.h,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categoryModel.data!.length,
                        itemBuilder: (context, index) {
                          return CategoryCircleItem(
                            index: index,
                            // TODO: remove this and get the category id from the api
                            categoryId: 18,
                            title: state.categoryModel.data![index].name!,
                            image:
                                state.categoryModel.data![index].categoryImage!,
                          );
                        },
                      ),
                    );
                  } else if (state is GetCategoriesError) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else {
                    return SizedBox(
                      width: double.infinity,
                      height: 100.h,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CustomShimmerLoadingContainer(
                                height: 50.h,
                                width: 60.w,
                                radius: 100.r,
                              ),
                              verticalSpace(12),
                              CustomShimmerLoadingContainer(
                                height: 10.h,
                                width: 60.w,
                                radius: 6.r,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              const CustomHomeDividerContainer(),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const HotSalesSection(),
              verticalSpace(24),
              const AllProductsSection(),
            ],
          ),
        )
      ],
    );
  }
}
