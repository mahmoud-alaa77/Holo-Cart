import 'dart:developer';

import 'package:animated_rating_bar/widgets/animated_rating_bar.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/local_db_helper.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/app_text_field.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/core/widgets/custom_loading_widget.dart';
import 'package:holo_cart/core/widgets/shimmer_loading_contianer.dart';
import 'package:holo_cart/features/cart/data/models/cart_item_model.dart';
import 'package:holo_cart/features/categories/logic/cubit/get_products_in_category_cubit.dart';
import 'package:holo_cart/features/favourites/data/models/add_or_delete_fav_body.dart';
import 'package:holo_cart/features/favourites/logic/cubit/favourite_cubit.dart';
import 'package:holo_cart/features/home/data/models/product_model.dart';
import 'package:holo_cart/features/home/logic/product_by_id/get_product_by_id_cubit.dart';
import 'package:holo_cart/features/login/logic/cubit/login_cubit.dart';
import 'package:holo_cart/features/product_details/data/models/review_request_model.dart';
import 'package:holo_cart/features/product_details/logic/cubit/add_review_cubit.dart';
import 'package:holo_cart/features/product_details/logic/cubit/get_product_colors_cubit.dart';
import 'package:holo_cart/features/product_details/ui/3d_view.dart';
import 'package:holo_cart/features/product_details/ui/widgets/silimilar_to_list_view.dart';
import 'package:holo_cart/features/profile/ui/widgets/guest_item.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsPage extends StatefulWidget {
  final int productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

late GetProductByIdCubit getProductByIdCubit;
bool? isFavorited;

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  TextEditingController commentController = TextEditingController();

  int selectedColorIndex = 0;
  String? selectedColorImage;
  int quantity = 1;
  late LoginCubit loginCubit;
  int currentUserId = 0;
  bool showImage = false;
  List<Reviews> localReviews = [];
  final formKey = GlobalKey<FormState>();
  int yourRate = 0;
  String yourComment = '';
  bool? isGuest;
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

  loadUserId() async {
    currentUserId = await SharedPrefHelper.getInt(SharedPrefKeys.userId);
    isGuest = await SharedPrefHelper.getBool(SharedPrefKeys.isGuest);
  }

  @override
  void initState() {
    getProductByIdCubit = BlocProvider.of<GetProductByIdCubit>(context);
    getProductByIdCubit.getProductById(productId: widget.productId);
    loginCubit = BlocProvider.of<LoginCubit>(context);
    loadUserId();
    BlocProvider.of<GetProductColorsCubit>(context)
        .getProductColors(widget.productId!);
    BlocProvider.of<FavouriteCubit>(context).getAllFavouriteProducts();
    // BlocProvider.of<GetProductsInCategoryCubit>(context)
    //     .getAllProductsInCategory(id: 5);
    super.initState();
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Lottie.asset("assets/images/succeess.json"),
    );

    // Automatically close after 1.5 seconds
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<GetProductByIdCubit, GetProductByIdState>(
          builder: (context, state) {
            if (state is GetProductByIdError) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is GetProductByIdSuccess) {
              final product = state.productModel.data!;
              bool fav = product.isFavorite!;
              localReviews = product.reviews ?? [];

              BlocProvider.of<GetProductsInCategoryCubit>(context)
                  .getAllProductsInCategory(id: product.categoryId!);
              return SingleChildScrollView(
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
                          verticalSpace(10),
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
                                    product.mainImageUrl.toString(),
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
                              product.isModel3D!
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
                                                        modelUrl:
                                                            product.modelUrl!,
                                                        title: product.name!,
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
                                    child: Text(product.name ?? "",
                                        style: AppTextStyles.font22W700,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  BlocBuilder<FavouriteCubit, FavouriteState>(
                                    builder: (context, state) {
                                      final cubit =
                                          context.read<FavouriteCubit>();
                                      final isFav = cubit.favProductIds
                                          .contains(product.productId);

                                      return IconButton(
                                        icon: Icon(
                                          isFav
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.redAccent,
                                        ),
                                        onPressed: () {
                                          if (isGuest! == true) {
                                            showDialog(
                                                context: context,
                                                builder: (context) => Center(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width -
                                                                100,
                                                        height: 300.h,
                                                        child: const Expanded(
                                                            child:
                                                                GuestWidget()),
                                                      ),
                                                    ));
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              Navigator.of(context).pop();
                                            });
                                          } else {
                                            if (isFav) {
                                              cubit.deleteProductToFavorite(
                                                body: AddOrDeleteFavBody(
                                                  productId: product.productId!
                                                      .toInt(),
                                                  userId: currentUserId,
                                                ),
                                              );
                                            } else {
                                              cubit.addProductToFavorite(
                                                body: AddOrDeleteFavBody(
                                                  productId: product.productId!
                                                      .toInt(),
                                                  userId: currentUserId,
                                                ),
                                              );
                                            }
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                              verticalSpace(10),
                              Row(
                                children: [
                                  Text(
                                    "\$ ${product.basePrice ?? ""}",
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
                                  Text("Colors",
                                      style: AppTextStyles.font24W600),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.amber, size: 20.sp),
                                      SizedBox(width: 4.w),
                                      Text(
                                        "${product.reviews!.isNotEmpty ? product.reviews![0].rating!.toDouble() : 0}",
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
                              BlocBuilder<GetProductColorsCubit,
                                  GetProductColorsState>(
                                builder: (context, state) {
                                  if (state is GetProductColorsSuccess) {
                                    final colors = state
                                        .getProductColorModel.data!
                                        .map((e) => Color(
                                            int.parse('0xFF${e.colorHex}')))
                                        .toList();

                                    final images = state
                                        .getProductColorModel.data!
                                        .map(
                                            (e) => e.image!.imageUrl.toString())
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
                                                    .copyWith(
                                                        color: Colors.red),
                                              ),
                                            ]
                                          : List.generate(colors.length,
                                              (index) {
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
                                                      color:
                                                          selectedColorIndex ==
                                                                  index
                                                              ? Colors.black
                                                                  .withAlpha(
                                                                      100)
                                                              : Colors
                                                                  .transparent,
                                                      width:
                                                          selectedColorIndex ==
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
                              Text("Description",
                                  style: AppTextStyles.font24W600),
                              verticalSpace(10),
                              ReadMoreText(
                                product.description ?? "",
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
                                        borderRadius:
                                            BorderRadius.circular(8.r),
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
                                              color:
                                                  AppColors.primaryOrangeColor,
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
                                              color:
                                                  AppColors.primaryOrangeColor,
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
                                currentProductId: product.productId!,
                              ),
                              verticalSpace(30),
                              ButtonItem(
                                color: AppColors.customRedColor,
                                onPressed: () {
                                  CartItemModel cartItem = CartItemModel(
                                    productId: product.productId!.toString(),
                                    title: product.name!,
                                    price: product.basePrice!.toDouble(),
                                    quantity: quantity,
                                    image: selectedColorImage ??
                                        product.mainImageUrl.toString(),
                                  );

                                  if (isGuest! == true) {
                                    showDialog(
                                        context: context,
                                        builder: (context) => Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width -
                                                        100,
                                                height: 300.h,
                                                child: const Expanded(
                                                    child: GuestWidget()),
                                              ),
                                            ));
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      Navigator.of(context).pop();
                                    });
                                  } else {
                                    DBHelper().insertCartItem(cartItem.toMap());

                                    showSuccessDialog(context);
                                  }
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
                              verticalSpace(16),

                              Text("Reviews", style: AppTextStyles.font24W600),
                              verticalSpace(10),

                              ...List.generate(
                                localReviews.length,
                                (index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 12.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30.r,
                                          backgroundColor: Theme.of(context)
                                                      .brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : AppColors.customDarkWhiteColor,
                                          child: Icon(
                                            Icons.person,
                                            color: AppColors.primaryOrangeColor,
                                            size: 35.r,
                                          ),
                                        ),
                                        horizontalSpace(8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  localReviews[index]
                                                          .userName ??
                                                      "",
                                                  style:
                                                      AppTextStyles.font16W600,
                                                ),
                                                horizontalSpace(16),
                                                RatingBar.readOnly(
                                                  size: 20.r,
                                                  filledIcon: Icons.star,
                                                  emptyIcon: Icons.star_border,
                                                  initialRating:
                                                      localReviews[index]
                                                              .rating
                                                              ?.toDouble() ??
                                                          0.0,
                                                  maxRating: 5,
                                                )
                                              ],
                                            ),
                                            Text(
                                              localReviews[index].comment ?? "",
                                              style: AppTextStyles.font12W400,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                              verticalSpace(16),
                              Form(
                                key: formKey,
                                child: AppTextFormField(
                                  labelText: "Your Review",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  backgroundColor:
                                      Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.black.withOpacity(.5)
                                          : AppColors.customDarkWhiteColor,
                                  controller: commentController,
                                ),
                              ),
                              verticalSpace(8),
                              Row(
                                children: [
                                  SizedBox(
                                    child: AnimatedRatingBar(
                                      activeFillColor:
                                          AppColors.customYellowColor,
                                      strokeColor: AppColors.customYellowColor,
                                      initialRating: 0.0,
                                      width: 120.w,
                                      height: 30.h,
                                      animationColor: AppColors.customRedColor,
                                      onRatingUpdate: (rating) {
                                        setState(() {
                                          yourRate = rating.toInt();
                                        });
                                        log("comment is ${commentController.text} and rating is $rating");
                                      },
                                    ),
                                  ),
                                  horizontalSpace(16),
                                  ButtonItem(
                                    color: AppColors.customRedColor,
                                    onPressed: () async {
                                      if (isGuest! == true) {
                                        showDialog(
                                            context: context,
                                            builder: (context) => Center(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width -
                                                        100,
                                                    height: 300.h,
                                                    child: const Expanded(
                                                        child: GuestWidget()),
                                                  ),
                                                ));
                                        Future.delayed(
                                            const Duration(seconds: 2), () {
                                          Navigator.of(context).pop();
                                        });
                                      } else {
                                        if (formKey.currentState!.validate()) {
                                          if (yourRate == 0) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      "Please provide a rating")),
                                            );
                                            return;
                                          }

                                          Review review = Review(
                                            userId: currentUserId,
                                            productId: product.productId!,
                                            comment: commentController.text,
                                            rating: yourRate,
                                          );

                                          final success = await BlocProvider.of<
                                                  AddReviewCubit>(context)
                                              .addReview(review: review);
                                          Reviews r = Reviews(
                                            rating: review.rating,
                                            comment: review.comment,
                                            userName: "",
                                          );
                                          if (success == true) {
                                            setState(() {
                                              localReviews.insert(0, r);
                                              commentController.clear();
                                              yourRate = 0;
                                            });
                                          }
                                          BlocProvider.of<GetProductByIdCubit>(
                                                  context)
                                              .getProductById(
                                                  productId:
                                                      product.productId!);
                                          showSuccessDialog(context);
                                        }
                                      }
                                    },
                                    text: "Submit",
                                    buttonTextStyle: Theme.of(context)
                                                .brightness ==
                                            Brightness.dark
                                        ? AppTextStyles.font13W500
                                            .copyWith(color: Colors.black)
                                        : AppTextStyles.font13W500
                                            .copyWith(color: Colors.white),
                                    width: 80.w,
                                    radius: 16.r,
                                  ),
                                ],
                              ),
                              verticalSpace(48),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CustomLoadingWidget(),
              );
            }
          },
        ),
      ),
    );
  }
}
