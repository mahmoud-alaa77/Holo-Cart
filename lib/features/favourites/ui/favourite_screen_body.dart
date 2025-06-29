import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/core/widgets/custom_loading_widget.dart';
import 'package:holo_cart/features/favourites/logic/cubit/favourite_cubit.dart';
import 'package:lottie/lottie.dart';

import 'widgets/favourite_cart_item.dart';

class FavouriteScreenBody extends StatefulWidget {
  const FavouriteScreenBody({super.key});

  @override
  State<FavouriteScreenBody> createState() => _FavouriteScreenBodyState();
}

int userId = 0;
loadUserId() async {
  userId = await SharedPrefHelper.getInt(SharedPrefKeys.userId) ?? 0;
}

class _FavouriteScreenBodyState extends State<FavouriteScreenBody> {
  @override
  void initState() {
    BlocProvider.of<FavouriteCubit>(context).getAllFavouriteProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 0, left: 15.w, right: 15.w),
        child: BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            if (state is FavouriteLoaded) {
              return state.favouritesModel.favouriteDataList!.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          verticalSpace(24),
                          Text(
                              "My Favourites (${state.favouritesModel.favouriteDataList!.length}) ",
                              style: AppTextStyles.font20W700),
                          verticalSpace(30),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5.w,
                              mainAxisSpacing: 10.h,
                              childAspectRatio: 0.6,
                            ),
                            itemCount: state.favouritesModel.favouriteDataList
                                    ?.length ??
                                0,
                            itemBuilder: (context, index) {
                              return FavouritCartItem(
                                favouriteProductData: state
                                    .favouritesModel.favouriteDataList![index],
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("assets/images/fav.json",
                              width: 150.w, height: 150.h),
                          Text("Your Favourites is empty",
                              style: AppTextStyles.font22W900),
                          verticalSpace(
                            16,
                          ),
                          SizedBox(
                            width: 200.w,
                            child: ButtonItem(
                                text: "Explore products",
                                radius: 30.sp,
                                color: AppColors.primaryOrangeColor,
                                onPressed: () async {
                                  GoRouter.of(context).push(AppRoutes.main,
                                      extra: await SharedPrefHelper.getInt(
                                          SharedPrefKeys.userId));
                                }),
                          )
                        ],
                      ),
                    );
            } else if (state is FavouriteError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(
                child: CustomLoadingWidget(),
              );
            }
          },
        ),
      ),
    );
  }
}
