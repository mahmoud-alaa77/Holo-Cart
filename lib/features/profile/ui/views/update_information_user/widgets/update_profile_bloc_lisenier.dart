import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/features/profile/logic/update_profile/update_profile_cubit.dart';

class UpdateProfileBlocLisenier extends StatelessWidget {
  const UpdateProfileBlocLisenier({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocListener<UpdateProfileCubit, UpdateProfileState>(
       listenWhen: (previous, current) =>
          current is UpdateProfileLoading || current is UpdateProfileSuccess || current is UpdateProfileFailure,
       listener: (context, state) {
      
      if (state is UpdateProfileSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("تم تحديث الملف الشخصي بنجاح")),
        );
       
      } else if (state is UpdateProfileLoading) {
        
      }
      else if (state is UpdateProfileFailure) {
        log("Error: ${state.errorMessage}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("خطأ: ${state.errorMessage}")),
        );
      }
    },
      child: const SizedBox(),
    );
  }
}