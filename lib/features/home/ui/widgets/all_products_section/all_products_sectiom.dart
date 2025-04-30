import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/shimmer_loading_contianer.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:holo_cart/features/home/logic/get_all_products/get_all_products_cubit.dart';
import 'package:holo_cart/features/home/ui/widgets/all_products_section/product_cart_item.dart';

class AllProductsSection extends StatelessWidget {
  const AllProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        if (state is GetAllProductsFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is GetAllProductsSuccess) {
          return Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 8.r),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: 8.r, horizontal: 16.r),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "All Products",
                      style: AppTextStyles.font20W700,
                    ),
                  ),
                ),
                verticalSpace(12),
                state.getAllProductsModel.data!.isEmpty
                    ? Padding(
                        padding:
                            EdgeInsetsDirectional.symmetric(vertical: 100.h),
                        child: Center(
                            child: Text(
                          "No products found",
                          style: AppTextStyles.font22W900,
                        )))
                    : GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.getAllProductsModel.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 9 / 15,
                            mainAxisSpacing: 10.r),
                        itemBuilder: (context, index) {
                          ProductData product =
                              state.getAllProductsModel.data![index];
                          return ProductCartItem(product: product);
                        },
                      )
              ],
            ),
          );
        } else {
          return Column(children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  vertical: 8.r, horizontal: 16.r),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "All Products",
                  style: AppTextStyles.font20W700,
                ),
              ),
            ),
            verticalSpace(16),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 9 / 15,
                  mainAxisSpacing: 10.r),
              itemBuilder: (context, index) {
                return CustomShimmerLoadingContainer(
                  width: MediaQuery.sizeOf(context).width / 2.2,
                  radius: 16.r,
                  height: 235.h,
                );
              },
            )
          ]);
        }
      },
    );
  }
}
