import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/shimmer_loading_contianer.dart';
import 'package:holo_cart/features/home/logic/get_products_by_discount/get_products_by_discount_cubit.dart';
import 'package:holo_cart/features/home/ui/widgets/hot_sales_section/hot_sales_product_item.dart';
import 'package:holo_cart/features/home/ui/widgets/hot_sales_section/hot_sales_values_list.dart';
import 'package:holo_cart/features/home/ui/widgets/hot_sales_section/time_box_widget.dart';

class HotSalesSection extends StatelessWidget {
  const HotSalesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsetsDirectional.symmetric(vertical: 8.r, horizontal: 16.r),
          child: Row(
            children: [
              Text(
                "Hot Sales",
                style: AppTextStyles.font20W700,
              ),
              const Spacer(),
              const Icon(Icons.timer_sharp),
              horizontalSpace(8),
              const TimeBoxWidget(
                contentTime: "05",
              ),
              horizontalSpace(4),
              const TimeBoxWidget(
                contentTime: "36",
              ),
              horizontalSpace(4),
              const TimeBoxWidget(
                contentTime: "00",
              ),
            ],
          ),
        ),
        verticalSpace(16),
        const HotSalesValuesList(),
        verticalSpace(16),
        BlocBuilder<GetProductsByDiscountCubit, GetProductsByDiscountState>(
          builder: (context, state) {
            if (state is GetProductsByDiscountError) {
              return Center(child: Text(state.error));
            } else if (state is GetProductsByDiscountSuccess) {
              return SizedBox(
                width: double.infinity,
                height: 270.h,
                child: state.getProductsByDiscountModel.products!.isEmpty
                    ? Center(
                        child: Text(
                        "No products found",
                        style: AppTextStyles.font20W700,
                      ))
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            state.getProductsByDiscountModel.products!.length,
                        itemBuilder: (context, index) {
                          return HotSalesProductItem(
                            discount: state.getProductsByDiscountModel
                                .products![index].discountPercentage
                                .toString(),
                            product: state
                                .getProductsByDiscountModel.products![index],
                          );
                        },
                      ),
              );
            } else {
              return SizedBox(
                width: double.infinity,
                height: 250.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CustomShimmerLoadingContainer(
                      width: MediaQuery.sizeOf(context).width / 2.2,
                      height: 220.h,
                    );
                  },
                ),
              );
            }
          },
        )
      ],
    );
  }
}
