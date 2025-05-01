import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/shimmer_loading_contianer.dart';
import 'package:holo_cart/features/categories/ui/widgets/category_cart_item.dart';
import 'package:holo_cart/features/home/logic/get_all_categories/get_categories_cubit.dart';

import '../../../core/helper/spacing.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 12.r),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 16.r, vertical: 16.r),
                child: Row(
                  children: [
                    Text(
                      "All Categories",
                      style: AppTextStyles.font22W900,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
                builder: (context, state) {
                  if (state is GetCategoriesSuccess) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.categoryModel.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: .75,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2),
                      itemBuilder: (context, index) {
                        return CategoryCartItem(
                          onTap: () async {
                            await context.push(AppRoutes.allProductsInCategory,
                                extra: 16);
                          },
                          categoryName: state.categoryModel.data![index].name!,
                          image:
                              state.categoryModel.data![index].categoryImage!,
                        );
                      },
                    );
                  } else if (state is GetCategoriesError) {
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .75,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 24.h),
                      itemBuilder: (context, index) {
                        return CustomShimmerLoadingContainer(
                          height: 100,
                          width: 20,
                          radius: 16.r,
                        );
                      },
                    );
                  }
                },
              ),
              verticalSpace(16.h)
            ],
          ),
        ),
      )
    ]);
  }
}
