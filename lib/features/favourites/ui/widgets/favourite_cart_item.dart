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
import 'package:holo_cart/features/favourites/data/models/add_or_delete_fav_body.dart';
import 'package:holo_cart/features/favourites/data/models/get_favourites_model.dart';
import 'package:holo_cart/features/favourites/logic/cubit/favourite_cubit.dart';

class FavouritCartItem extends StatelessWidget {
  final FavouriteData favouriteProductData;
  const FavouritCartItem({
    super.key,
    required this.favouriteProductData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.productDetails,
            extra: favouriteProductData.productId);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.customBlackColor.withValues(alpha: .5)
              : const Color.fromARGB(255, 241, 239, 239),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: .25),
              blurRadius: 1.r,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 150.h,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                  child: Image.network(
                    favouriteProductData.mainImageUrl ?? "",
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(
                        Icons.error,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            verticalSpace(2),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favouriteProductData.name ?? "",
                    style: AppTextStyles.font14W600,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        "${favouriteProductData.basePrice} \$",
                        style: AppTextStyles.font12W700,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () async {
                          AddOrDeleteFavBody product = AddOrDeleteFavBody(
                            productId: favouriteProductData.productId!,
                            userId: await SharedPrefHelper.getInt(
                                SharedPrefKeys.userId),
                          );
                          BlocProvider.of<FavouriteCubit>(context)
                              .deleteProductFromFavorite(body: product);
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
