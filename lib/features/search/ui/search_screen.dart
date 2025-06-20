import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/widgets/app_text_field.dart';
import 'package:holo_cart/core/widgets/custom_loading_widget.dart';
import 'package:holo_cart/features/home/ui/widgets/all_products_section/product_cart_item.dart';
import 'package:holo_cart/features/search/logic/cubit/seach_cubit.dart';
import 'package:holo_cart/features/search/ui/widgets/not_match_search_result.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(24),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 26.sp,
                      ),
                    ),
                    // horizontalSpace(12),
                    Expanded(
                      child: SizedBox(
                        height: 45.h,
                        child: AppTextFormField(
                          backgroundColor: AppColors.customWhiteColor,
                          labelText: "Search here ...",
                          labelStyle: TextStyle(
                              color: AppColors.customBlackColor,
                              fontSize: 12.sp),
                          validator: (value) {},
                          onChanged: (value) {
                            context
                                .read<SearchCubit>()
                                .search(searchTerm: value);
                          },
                          prefixIcon: const Icon(Icons.search),
                          // suffixIcon: const Icon(Icons.mic),
                        ),
                      ),
                    )
                  ],
                ),
                verticalSpace(16),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoaded) {
                      if (state.products.isEmpty) {
                        return Column(
                          children: [
                            verticalSpace(120),
                            const NotMatchSearchResult(),
                          ],
                        );
                      }
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 9 / 17,
                            mainAxisSpacing: 10.r),
                        itemBuilder: (context, index) {
                          return ProductCartItem(
                              product: state.products[index]);
                        },
                      );
                    } else if (state is SearchInitial) {
                      return Column(
                        children: [
                          verticalSpace(120),
                          const NotMatchSearchResult(),
                        ],
                      );
                    } else if (state is SearchError) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      return Column(
                        children: [
                          verticalSpace(120),
                          const CustomLoadingWidget(),
                        ],
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
