import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/core/widgets/shimmer_loading_contianer.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:holo_cart/features/product_details/logic/cubit/get_product_colors_cubit.dart';
import 'package:holo_cart/features/product_details/ui/widgets/product_colors.dart';
import 'package:holo_cart/features/product_details/ui/widgets/silimilar_to_list_view.dart';
import 'package:readmore/readmore.dart';

class InformationProductDetails extends StatelessWidget {
  final ProductData product;
  const InformationProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.customBlackColor.withValues(alpha: .5)
                : AppColors.customWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            )),
        child: Padding(
          padding: EdgeInsets.only(left: 15.0.w, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.name ?? "",
                    style: AppTextStyles.font22W700,
                  ),
                  Spacer(),
                  const Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.redAccent,
                  )
                ],
              ),
              verticalSpace(10),
              Row(
                children: [
                  Text(
                    "\$ ${product.basePrice ?? ""}",
                    style: AppTextStyles.font20W700
                        .copyWith(color: AppColors.primaryOrangeColor),
                  ),
                  Text(
                    " | Including taxes and duties",
                    style: AppTextStyles.font12W400,
                  )
                ],
              ),
              Text(
                "Colors ",
                style: AppTextStyles.font24W600,
              ),
              Row(
                children: [
                  BlocBuilder<GetProductColorsCubit, GetProductColorsState>(
                      builder: (context, state) {
                    if (state is GetProductColorsSuccess) {
                      return ProductColors(
                        colors: state.getProductColorModel.data!
                            .map((e) => Color(int.parse('0xFF${e.colorHex}')))
                            .toList(),
                      );
                    } else if (state is GetProductColorsFailure) {
                      return Text(state.message.toString());
                    } else {
                      return SizedBox(
                        height: 30.h,
                        width: 130.w,
                        child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomShimmerLoadingContainer(
                                height: 24.h, width: 24.w);
                          },
                        ),
                      );
                    }
                  }),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20.sp),
                      SizedBox(width: 4.w),
                      Text(
                        "4.8",
                        style: AppTextStyles.font18W600,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "(${product.reviews?.length ?? 0})",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace(10),
              Text("Description", style: AppTextStyles.font24W600),
              verticalSpace(10),
              ReadMoreText(
                product.description ?? "",
                trimLines: 3,
                colorClickableText: Colors.blue,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read more',
                trimExpandedText: ' Show less',
                style: AppTextStyles.font14W600.copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.customWhiteColor
                      : AppColors.customLightGrayColor,
                ),
                moreStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              verticalSpace(10),
              const SimilarTOListView(),
              verticalSpace(30),
              ButtonItem(
                onPressed: () {},
                text: "Add to cart",
                radius: 30,
              ),
              verticalSpace(10),
              ButtonItem(
                onPressed: () {},
                text: "Buy Now",
                color: AppColors.customRedColor,
                radius: 30,
              ),
              verticalSpace(33)
            ],
          ),
        ),
      ),
    );
  }
}
