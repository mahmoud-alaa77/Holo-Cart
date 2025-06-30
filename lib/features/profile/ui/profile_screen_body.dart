import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';

import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/cart/logic/cubit/cart_cubit.dart';
import 'package:holo_cart/features/profile/ui/views/about/about_screen.dart';
import 'package:holo_cart/features/profile/ui/widgets/profile_bloc_builder.dart';
import 'package:holo_cart/features/profile/ui/widgets/profile_list_button.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});
  Future<void> launchFacebook() async {
    final url = Uri.parse('https://www.facebook.com/mahmoud.alaa.581457');

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode
            .externalApplication, // opens in Facebook app if installed, else browser
      );
    } else {
      throw 'Could not launch $url';
    }
  }

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

            verticalSpace(24),

            const ProfileBlocBuilder(),

            verticalSpace(24),
            ProfileListButton(
              title: "Address",
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.address);
              },
            ),

            //ProfileListButton(title: "Setting", onPressed: () {}),
            ProfileListButton(
              title: "About Shope",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AboutScreen()),
                );
              },
            ),

            ProfileListButton(
                title: "Help & Support",
                onPressed: () async {
                  await launchFacebook();
                }),
            verticalSpace(24),
            GestureDetector(
              onTap: () {
                context.read<CartCubit>().clearCart();

                SharedPrefHelper.removeDataByKey(SharedPrefKeys.token);
                SharedPrefHelper.removeDataByKey(SharedPrefKeys.isGuest);

                context.go(AppRoutes.mainAuth);
              },
              child: Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(.8),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Center(
                  child: Icon(Icons.logout, color: Colors.white, size: 40.sp),
                ),
              ),
            ),
            verticalSpace(70),
          ],
        ),
      ),
    );
  }
}
