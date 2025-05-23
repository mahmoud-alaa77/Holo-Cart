import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/features/profile/data/model/get_profile_model/profile_response_model.dart';

class ProfileImage extends StatelessWidget {
  final UserProfileModel user;

  const ProfileImage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = user.profileImage != null && user.profileImage!.isNotEmpty;

    return GestureDetector(
      onTap: () {
        if (hasImage) {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              child: InteractiveViewer(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(user.profileImage!),
                ),
              ),
            ),
          );
        }
      },
      child: CircleAvatar(
        radius: 60.r,
        backgroundColor: AppColors.customLightGrayColor,
        child: CircleAvatar(
          radius: 70.r,
          backgroundColor: Colors.white,
          backgroundImage: hasImage
              ? NetworkImage(user.profileImage!)
              : const AssetImage("assets/images/user.png") as ImageProvider,
        ),
      ),
    );
  }
}
