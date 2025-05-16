import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/features/profile/logic/cubit/userprofile_cubit.dart';
import 'package:holo_cart/features/profile/ui/widgets/edit_profile_container.dart';

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit , UserprofileState>(
      builder: (context, state) {
        if (state is UserprofileLoading) {
          return const CircularProgressIndicator();
        } else if (state is UserprofileLoaded) {
          final user = state.user;
          return EditProfileContainer(
            name: user.fullName,
            email: user.email,
            phone: user.phoneNumber,
          );
        } else if (state is UserprofileError) {
          log("Error: ${state.error}");
          return Text("خطأ: ${state.error}");

        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
