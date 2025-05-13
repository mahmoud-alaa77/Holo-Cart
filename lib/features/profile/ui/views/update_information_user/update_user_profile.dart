import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/appbar_screen.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/profile/ui/views/update_information_user/widgets/change_profile_photo.dart';

import 'widgets/update_profile_text_fileds.dart';

class UpdateUserProfile extends StatelessWidget {
  const UpdateUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric( vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppbarScreen(title: "Setting"),
              verticalSpace(20),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your Profile",
                    style: AppTextStyles.font24W500,
                  )),
              verticalSpace(20),
              const ChangeProfilePhoto(),
              const UpdateProfileTextFileds(),
              verticalSpace(40),
              ButtonItem(
                text: "Save Changes",
                onPressed: () {},
                color: AppColors.primaryOrangeColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
