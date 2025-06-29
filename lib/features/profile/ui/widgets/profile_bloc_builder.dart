import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/widgets/custom_loading_widget.dart';
import 'package:holo_cart/features/profile/logic/get_profile/userprofile_cubit.dart';
import 'package:holo_cart/features/profile/ui/widgets/edit_profile_container.dart';
import 'package:holo_cart/features/profile/ui/widgets/guest_item.dart';
import 'package:holo_cart/features/profile/ui/widgets/profile_image.dart';

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit, UserprofileState>(
      builder: (context, state) {
        if (state is UserprofileLoading) {
          return SizedBox(height: 200.h, child: const CustomLoadingWidget());
        } else if (state is UserprofileLoaded) {
          final user = state.user;
          return Column(
            children: [
              ProfileImage(user: user),
              verticalSpace(24),
              EditProfileContainer(user: user),
            ],
          );
        } else if (state is GuestProfileState) {
          return const GuestWidget();
        } else if (state is UserprofileError) {
          return Text("خطأ: ${state.error}");
        } else if (state is UserProfileGuestState) {
          return const Text("تسجيل الدخول كزائر");
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
