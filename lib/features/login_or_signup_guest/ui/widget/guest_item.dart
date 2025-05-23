import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

class GuestItem extends StatelessWidget {
  const GuestItem({
    super.key,
  });

  void _showGuestConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            margin:  EdgeInsets.symmetric(horizontal: 15.w),
            padding:  EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.sp),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(200),
                  blurRadius: 20.sp,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
             
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    shape: BoxShape.circle,
                  ),
                  child:  Icon(
                    Icons.warning_amber_rounded,
                    color:AppColors.primaryOrangeColor,
                    size: 30.sp,
                  ),
                ),
                verticalSpace(20),
                
                // العنوان
                 Text(
                  'Are you sure you want to log in as a guest ?',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                    height: 1.4.h,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                
                // النص التوضيحي
                 Text(
                  'You can\'t be buy any purchase',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF718096),
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(20),
                
                // الأزرار
                Row(
                  children: [
                    // زر الإلغاء
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: AppColors.customBlackColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child:  Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    horizontalSpace(12),
                    
                    // زر الموافقة
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          GoRouter.of(context).go(AppRoutes.main);
                        },
                        child: Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: AppColors.primaryOrangeColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child:  Center(
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 8.h, bottom: 10.h),
      child: GestureDetector(
        onTap: () {
          _showGuestConfirmationDialog(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Text(
                  "Continue as a guest",
                  style: TextStyle(
                    fontSize: 20.sp,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.5
                      ..color = Colors.black,
                  ),
                ),
                 Text(
                  "Continue as a guest",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward,
              color: AppColors.customBlackColor,
            ),
          ],
        ),
      ),
    );
  }
}