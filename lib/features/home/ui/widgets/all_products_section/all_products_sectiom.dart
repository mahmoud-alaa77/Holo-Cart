import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/custom_rating_widget.dart';
import 'package:holo_cart/core/widgets/shimmer_loading_contianer.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:holo_cart/features/home/logic/get_all_products/get_all_products_cubit.dart';

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

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({
    super.key,
    required this.product,
  });

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.productDetails, extra: product);
      },
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 8.r, vertical: 4.r),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withValues(alpha: .5),
                offset: const Offset(0, 2),
                blurRadius: 2)
          ],
          borderRadius: BorderRadius.circular(16.r),
        ),
        width: MediaQuery.sizeOf(context).width / 2.2,
        height: 235.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
                child: Image.network(
                  product.mainImageUrl.toString(),
                  height: 120.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      height: 120.h,
                      width: double.infinity,
                      child: const Center(
                        child: Icon(Icons.error),
                      ),
                    );
                  },
                )),
            verticalSpace(6),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 6.r),
              child: Text(
                product.name!,
                style: AppTextStyles.font18W500,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            verticalSpace(2),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 6.r),
              child: Text(
                product.description ?? "",
                style: AppTextStyles.font14W500,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            verticalSpace(3),
            Text(
              " ${product.finalPrice}\$",
              style: AppTextStyles.font16W500,
            ),
            verticalSpace(6),
            CustomRatingWidget(
              numberOfRatings: product.reviews?.length ?? 0,
            ),
          ],
        ),
      ),
    );
  }
}
