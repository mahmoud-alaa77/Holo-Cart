import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/local_db_helper.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/core/widgets/shimmer_loading_contianer.dart';
import 'package:holo_cart/features/cart/data/models/cart_item_model.dart';
import 'package:holo_cart/features/categories/logic/cubit/get_products_in_category_cubit.dart';
import 'package:holo_cart/features/favourites/data/models/add_or_delete_fav_body.dart';
import 'package:holo_cart/features/favourites/logic/cubit/favourite_cubit.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:holo_cart/features/home/logic/get_all_products/get_all_products_cubit.dart';
import 'package:holo_cart/features/login/logic/cubit/login_cubit.dart';
import 'package:holo_cart/features/product_details/logic/cubit/get_product_colors_cubit.dart';
import 'package:holo_cart/features/product_details/ui/3d_view.dart';
import 'package:holo_cart/features/product_details/ui/widgets/silimilar_to_list_view.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductData product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedColorIndex = 0;
  String? selectedColorImage;
  int quantity = 1;
  late LoginCubit loginCubit;
  int currentUserId = 0;
  bool showImage = false;
  late bool isFavorited;
  void onButtonPressed() {
    setState(() {
      showImage = true;
    });

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showImage = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loginCubit = BlocProvider.of<LoginCubit>(context);
    currentUserId = loginCubit.currentUserId;
    isFavorited = false;
    BlocProvider.of<GetProductColorsCubit>(context)
        .getProductColors(widget.product.productId!);
    BlocProvider.of<GetProductsInCategoryCubit>(context)
        .getAllProductsInCategory(id: widget.product.categoryId!);
    isFavorited = widget.product.isFavorite!;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await BlocProvider.of<GetAllProductsCubit>(context).getAllProducts();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.customBlackColor.withOpacity(0.5)
                        : AppColors.customWhiteColor,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(25.r),
                      right: Radius.circular(25.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      verticalSpace(40),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 26.sp,
                              ),
                            ),
                            const Spacer(flex: 2),
                            Text("Product Details",
                                style: AppTextStyles.font24W800),
                            const Spacer(flex: 3),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Image.network(
                            selectedColorImage ??
                                widget.product.mainImageUrl.toString(),
                            height: 300.h,
                            width: double.infinity,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return SizedBox(
                                  height: 300.h,
                                  width: double.infinity,
                                  child: const Icon(Icons.error));
                            },
                          ),
                          widget.product.isModel3D!
                              ? Positioned(
                                  top: 16.h,
                                  right: 0,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 18.w),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.language,
                                        size: 30.r,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ThreeDViewer(
                                                    modelUrl: widget
                                                        .product.modelUrl!,
                                                    title: widget.product.name!,
                                                  )),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.customBlackColor.withOpacity(0.5)
                          : AppColors.customWhiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0.w, right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(widget.product.name ?? "",
                                    style: AppTextStyles.font22W700,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isFavorited == true) {
                                      BlocProvider.of<FavouriteCubit>(context)
                                          .deleteProductToFavorite(
                                        body: AddOrDeleteFavBody(
                                            productId: widget.product.productId!
                                                .toInt(),
                                            userId: 4),
                                      );
                                      isFavorited = false;
                                      BlocProvider.of<GetAllProductsCubit>(
                                              context)
                                          .getAllProducts();
                                    } else {
                                      BlocProvider.of<FavouriteCubit>(context)
                                          .addProductToFavorite(
                                        body: AddOrDeleteFavBody(
                                            productId: widget.product.productId!
                                                .toInt(),
                                            userId: 4),
                                      );
                                      isFavorited = true;
                                      BlocProvider.of<GetAllProductsCubit>(
                                              context)
                                          .getAllProducts();
                                    }
                                  });
                                },
                                icon: isFavorited == true
                                    ? const Icon(Icons.favorite,
                                        color: Colors.redAccent)
                                    : const Icon(Icons.favorite_border,
                                        color: Colors.redAccent),
                              )
                            ],
                          ),
                          verticalSpace(10),
                          Row(
                            children: [
                              Text(
                                "\$ ${widget.product.basePrice ?? ""}",
                                style: AppTextStyles.font20W700.copyWith(
                                  color: AppColors.primaryOrangeColor,
                                ),
                              ),
                              Text(
                                " | Including taxes and duties",
                                style: AppTextStyles.font12W400,
                              ),
                            ],
                          ),
                          verticalSpace(10),
                          Row(
                            children: [
                              Text("Colors", style: AppTextStyles.font24W600),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 20.sp),
                                  SizedBox(width: 4.w),
                                  Text(
                                    "4.8",
                                    style: AppTextStyles.font18W600,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    "(${widget.product.reviews?.length ?? 0})",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          BlocBuilder<GetProductColorsCubit,
                              GetProductColorsState>(
                            builder: (context, state) {
                              if (state is GetProductColorsSuccess) {
                                final colors = state.getProductColorModel.data!
                                    .map((e) =>
                                        Color(int.parse('0xFF${e.colorHex}')))
                                    .toList();

                                final images = state.getProductColorModel.data!
                                    .map((e) => e.image!.imageUrl.toString())
                                    .toList();

                                if (selectedColorImage == null &&
                                    images.isNotEmpty) {
                                  selectedColorImage = images[0];
                                }

                                return Row(
                                  children: colors.isEmpty
                                      ? [
                                          Text(
                                            "No colors available",
                                            style: AppTextStyles.font14W600
                                                .copyWith(color: Colors.red),
                                          ),
                                        ]
                                      : List.generate(colors.length, (index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedColorIndex = index;
                                                selectedColorImage =
                                                    images[index];
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 2.w),
                                              width: 30.w,
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: colors[index],
                                                border: Border.all(
                                                  color: selectedColorIndex ==
                                                          index
                                                      ? Colors.black
                                                          .withAlpha(100)
                                                      : Colors.transparent,
                                                  width: selectedColorIndex ==
                                                          index
                                                      ? 3.w
                                                      : 0,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
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
                                        height: 24.h,
                                        width: 24.w,
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                          verticalSpace(10),
                          Text("Description", style: AppTextStyles.font24W600),
                          verticalSpace(10),
                          ReadMoreText(
                            widget.product.description ?? "",
                            trimLines: 3,
                            colorClickableText: Colors.blue,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Read more',
                            trimExpandedText: ' Show less',
                            style: AppTextStyles.font14W600.copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors.customWhiteColor
                                  : AppColors.customLightGrayColor,
                            ),
                            moreStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          verticalSpace(20),
                          Stack(children: [
                            Row(
                              children: [
                                Text("Quantity",
                                    style: AppTextStyles.font24W600),
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.primaryOrangeColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          if (quantity > 1) {
                                            setState(() {
                                              quantity--;
                                            });
                                          }
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          color: AppColors.primaryOrangeColor,
                                          size: 20.sp,
                                        ),
                                      ),
                                      Text(
                                        quantity.toString(),
                                        style: AppTextStyles.font18W600,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: AppColors.primaryOrangeColor,
                                          size: 20.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (showImage)
                              Positioned(
                                top: 100,
                                child: Image.asset(
                                  'assets/images/bag.png',
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                          ]),
                          verticalSpace(10),
                          SimilarTOListView(
                            currentProductId: widget.product.productId!,
                          ),
                          verticalSpace(30),
                          ButtonItem(
                            color: AppColors.customRedColor,
                            onPressed: () {
                              setState(() {
                                CartItemModel cartItem = CartItemModel(
                                  productId:
                                      widget.product.productId!.toString(),
                                  title: widget.product.name!,
                                  price: widget.product.basePrice!.toDouble(),
                                  quantity: quantity,
                                  image: selectedColorImage ??
                                      widget.product.mainImageUrl.toString(),
                                );

                                DBHelper().insertCartItem(cartItem.toMap());
                                // showDialog(
                                //   context: context,
                                //   builder: (context) {
                                //     return AlertDialog(
                                //       icon: const Icon(
                                //         Icons.check_circle,
                                //         color: Colors.green,
                                //         size: 32,
                                //       ),
                                //       content: const Text(
                                //           "Added to cart successfully"),
                                //       actions: [
                                //         TextButton(
                                //           onPressed: () {
                                //             context.pop();
                                //           },
                                //           child: const Text("Got it"),
                                //         ),
                                //       ],
                                //     );
                                //   },
                                // );
                              });
                            },
                            text: "Add to cart",
                            radius: 30,
                          ),
                          // verticalSpace(10),
                          // ButtonItem(
                          //   onPressed: () {
                          //     onButtonPressed();
                          //   },
                          //   text: "Buy Now",
                          //   color: AppColors.customRedColor,
                          //   radius: 30,
                          // ),
                          verticalSpace(33),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
