import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/shimmer_loading_contianer.dart';
import 'package:holo_cart/features/categories/logic/cubit/get_products_in_category_cubit.dart';
import 'package:holo_cart/features/product_details/ui/widgets/similar_to_cart_item.dart';

class SimilarTOListView extends StatelessWidget {
  const SimilarTOListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Similar To",
            style: AppTextStyles.font24W600,
          ),
        ),
        verticalSpace(10),
        BlocBuilder<GetProductsInCategoryCubit, GetProductsInCategoryState>(
          builder: (context, state) {
            if (state is GetProductsInCategorySuccess) {
              return SizedBox(
                width: double.infinity,
                height: 230.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SimilarToCartItem(
                    product: state.allProductsModel.data![index],
                  ),
                  itemCount: state.allProductsModel.data!.length,
                ),
              );
            } else if (state is GetProductsInCategoryError) {
              return SizedBox(
                width: double.infinity,
                height: 220.h,
                child: Center(
                  child: Text(state.message),
                ),
              );
            } else {
              return SizedBox(
                width: double.infinity,
                height: 220.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      CustomShimmerLoadingContainer(
                    height: 200,
                    width: 140,
                    radius: 16.r,
                  ),
                  itemCount: 5,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
