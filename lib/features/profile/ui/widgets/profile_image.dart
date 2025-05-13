import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: InteractiveViewer(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset("assets/images/user.png"),
                ),
              ),
            ),
          ),
        );
      },
      child: CircleAvatar(
        radius: 60.r,
        backgroundColor: AppColors.customLightGrayColor,
        child: CircleAvatar(
          radius: 70.r,
          backgroundColor: Colors.white,
          backgroundImage: const AssetImage("assets/images/user.png"),
        ),
      ),
    );
  }
}
