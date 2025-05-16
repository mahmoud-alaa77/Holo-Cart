import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:holo_cart/core/helper/spacing.dart';

import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/profile/ui/views/about/about_screen.dart';
import 'package:holo_cart/features/profile/ui/views/address/address_screen.dart';
import 'package:holo_cart/features/profile/ui/views/payment/payment_screen.dart';
import 'package:holo_cart/features/profile/ui/widgets/profile_bloc_builder.dart';
import 'package:holo_cart/features/profile/ui/widgets/profile_image.dart';
import 'package:holo_cart/features/profile/ui/widgets/profile_list_button.dart';


class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(24),
            Text("Profile", style: AppTextStyles.font24W900),
            verticalSpace(20),
            const ProfileImage(),
            verticalSpace(24),

          const  ProfileBlocBuilder(),

            verticalSpace(24),
            ProfileListButton(
              title: "Address",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AddressScreen()),
                );
              },
            ),
            ProfileListButton(
              title: "Payment",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PaymentScreen()),
                );
              },
            ),
            ProfileListButton(title: "Setting", onPressed: () {}),
            ProfileListButton(
              title: "About Shope",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AboutScreen()),
                );
              },
            ),
            ProfileListButton(title: "Help & Support", onPressed: () {}),
            verticalSpace(100),
          ],
        ),
      ),
    );
  }
}

