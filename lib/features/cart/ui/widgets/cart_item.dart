import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/local_db_helper.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/cart/data/models/cart_item_model.dart';

class CartItem extends StatefulWidget {
  final CartItemModel cartItem;
  const CartItem({super.key, required this.cartItem});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int quantity;
  final dbHelper = DBHelper(); // كلاس المساعدة للـ SQLite

  @override
  void initState() {
    super.initState();
    quantity = widget.cartItem.quantity;
  }

  Future<void> updateQuantity(int newQuantity) async {
    setState(() {
      quantity = newQuantity;
    });

    await dbHelper.updateQuantity(widget.cartItem.productId, newQuantity);
  }

  void increaseQuantity() {
    updateQuantity(quantity + 1);
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      updateQuantity(quantity - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      height: 100.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.customLightColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          // صورة المنتج
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              widget.cartItem.image,
              width: 70.w,
              height: 70.h,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(10),
          // تفاصيل المنتج
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cartItem.title,
                        style: AppTextStyles.font14W600,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(8),
                      Text(
                        "\$${widget.cartItem.price}",
                        style: AppTextStyles.font12W700,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: increaseQuantity,
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      "+",
                      style: AppTextStyles.font12W700.copyWith(
                        color: AppColors.customRedColor,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),
              horizontalSpace(6),
              Text(
                "$quantity",
                style: AppTextStyles.font14W500,
              ),
              horizontalSpace(6),
              GestureDetector(
                onTap: decreaseQuantity,
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      "-",
                      style: AppTextStyles.font12W700.copyWith(
                        color: AppColors.customRedColor,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
