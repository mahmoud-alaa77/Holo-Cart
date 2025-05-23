import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/features/profile/logic/update_profile/update_profile_cubit.dart';

class UpdateProfileBlocListener extends StatelessWidget {
  const UpdateProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listenWhen: (previous, current) =>
          current is UpdateProfileLoading ||
          current is UpdateProfileSuccess ||
          current is UpdateProfileFailure,
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          
          Navigator.of(context, rootNavigator: true).pop();
          
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("تم تحديث الملف الشخصي بنجاح"),
              backgroundColor: Colors.green,

              duration: Duration(seconds: 3),
            ),
          );
        } else if (state is UpdateProfileLoading) {
          showLoadingDialog(context);
         
        } else if (state is UpdateProfileFailure) {
          
          Navigator.of(context, rootNavigator: true).pop();
          
          log("Error: ${state.errorMessage}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("خطأ: ${state.errorMessage}"),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 4),
            ),
          );
        }
      },
      child: const SizedBox(),
    );
  }
}
void showLoadingDialog(BuildContext context) {
   showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(200),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // أيقونة التحميل المتحركة مع تأثير جميل
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                             AppColors.primaryOrangeColor,
                              AppColors.primaryOrangeColor,
                            ],
                          ),
                        ),
                        child:  Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              'assets/images/loading.gif',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // النص الرئيسي
                      const Text(
                        'جاري تحديث الملف الشخصي',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2D3748),
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      
                      // النص الثانوي
                      Text(
                        'يرجى الانتظار، سيتم الانتهاء قريباً...',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF718096),
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          );

}