import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/home/logic/cubit/get_products_by_discount_cubit.dart';
import 'package:holo_cart/features/home/logic/discounts/discounts_cubit.dart';

class HotSalesValuesList extends StatefulWidget {
  const HotSalesValuesList({super.key});

  @override
  State<HotSalesValuesList> createState() => _HotSalesValuesListState();
}

class _HotSalesValuesListState extends State<HotSalesValuesList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 10.r),
      height: 35.h,
      decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: .3),
          borderRadius: BorderRadius.circular(12.r)),
      child: BlocBuilder<DiscountsCubit, DiscountsState>(
        builder: (context, state) {
          if (state is DiscountsLoaded) {
            return ListView.builder(
                itemCount: state.discountsModel.data!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        BlocProvider.of<GetProductsByDiscountCubit>(context)
                            .getProductsByDiscount(
                                "${state.discountsModel.data![index].percentage}");
                      });
                      log(selectedIndex.toString());
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 8.r),
                      child: selectedIndex == index
                          ? Stack(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 12.r),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      border: Border.all(
                                          color: AppColors.primaryOrangeColor,
                                          width: 2),
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.black
                                          : Colors.white),
                                  child: Center(
                                    child: Text(
                                      "${state.discountsModel.data![index].percentage}%",
                                      style: AppTextStyles.font16W500.copyWith(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18.sp,
                                          color: AppColors.primaryOrangeColor),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: -8,
                                    right: index == 0 ? 18.w : 18.w,
                                    child: const Icon(
                                      Icons.arrow_drop_down,
                                      color: AppColors.primaryOrangeColor,
                                    ))
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 4),
                              child: Center(
                                child: Text(
                                  "${state.discountsModel.data![index].percentage}%",
                                  style: AppTextStyles.font16W500
                                      .copyWith(fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                    ),
                  );
                });
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
