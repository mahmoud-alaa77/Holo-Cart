import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/core/widgets/custom_loading_widget.dart';
import 'package:holo_cart/features/login/logic/cubit/login_cubit.dart';
import 'package:lottie/lottie.dart';

class LoginBlocListner extends StatelessWidget {
  const LoginBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginFailure,
      listener: (context, state) {
        debugPrint("LoginBlocListener State: $state");

        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CustomLoadingWidget(),
          );
        } else if (state is LoginSuccess) {
          context.pop();
          context.go(AppRoutes.main,
              extra: BlocProvider.of<LoginCubit>(context).currentUserId ?? 1);
        } else if (state is LoginFailure) {
          context.pop();
          setupErrorState(context, state.errorMessage);
        }
      },
      child: const SizedBox(),
    );
  }
}

void setupErrorState(BuildContext context, String errorMessage) {
  showDialog(
  context: context,
  builder: (context) => AlertDialog(
    contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          "assets/images/error404.json",
          width: 150,
          height: 150,
        ),
        verticalSpace( 12),
        
        Text(
          " Error: $errorMessage",
          style: AppTextStyles.font16W500.copyWith(
            color: Colors.red,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    actions: [
      TextButton(
  onPressed: () {
    context.pop();
  },
  style: TextButton.styleFrom(
    backgroundColor: AppColors.primaryOrangeColor, // لون الخلفية الخفيف
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // الزوايا الدائرية
    ),
    padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
  ),
  child: Text(
    'Got it',
    style: AppTextStyles.font15W500.copyWith(
      
    ),
  ),
),

    ],
  ),
);
}
