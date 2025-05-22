import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/features/profile/logic/update_profile/update_profile_cubit.dart';
import 'package:image_picker/image_picker.dart';

class ChangeProfilePhoto extends StatelessWidget {
  const ChangeProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      builder: (context, state) {
        final cubit = context.read<UpdateProfileCubit>();
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            GestureDetector(
              onTap: () {
                if (cubit.profileImage != null) {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: InteractiveViewer(
                        child: Image.file(cubit.profileImage!),
                      ),
                    ),
                  );
                }
              },
              child: CircleAvatar(
                radius: 80.sp,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: cubit.profileImage != null
                    ? FileImage(cubit.profileImage!)
                    : const AssetImage("assets/images/user.png")
                        as ImageProvider,
              ),
            ),
            Positioned(
              bottom: 13.h,
              right: 13.w,
              child: InkWell(
                onTap: () async {
                  final picker = ImagePicker();
                  final picked = await picker.pickImage(source: ImageSource.gallery);
                  if (picked != null) {
                    cubit.setProfileImage(File(picked.path));
                  }
                },
                child: CircleAvatar(
                  radius: 15.sp,
                  backgroundColor: AppColors.primaryOrangeColor,
                  child: const Icon(CupertinoIcons.pen, color: Colors.white, size: 25),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
