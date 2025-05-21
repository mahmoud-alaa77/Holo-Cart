import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';

import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/custom_loading_widget.dart';
import 'package:holo_cart/features/favourites/logic/cubit/favourite_cubit.dart';

import 'widgets/favourite_cart_item.dart';

class FavouriteScreenBody extends StatelessWidget {
  const FavouriteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 0, left: 15.w, right: 15.w),
        child: BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            if (state is FavouriteLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpace(24),
                    Text("My Favourites (12) ",
                        style: AppTextStyles.font20W700),
                    verticalSpace(30),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: 0.6,
                      ),
                      itemCount:
                          state.favouriteItems.favouriteDataList?.length ?? 0,
                      itemBuilder: (context, index) {
                        return FavouritCartItem(
                          favouriteProductData:
                              state.favouriteItems.favouriteDataList![index],
                        );
                      },
                    ),
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
