import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';

import 'widgets/custom_proccess_idicator.dart';

class ProccessingOrderScreen extends StatefulWidget {
  const ProccessingOrderScreen({super.key});

  @override
  State<ProccessingOrderScreen> createState() => _ProccessingOrderScreenState();
}

class _ProccessingOrderScreenState extends State<ProccessingOrderScreen> {
  int _currentStep = 0;
  final int _totalSteps = 3;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        if (_currentStep < _totalSteps - 1) {
          _currentStep++;
        } else {
          _timer.cancel();

          Future.delayed(const Duration(milliseconds: 500), () {
            GoRouter.of(context).pushReplacement(AppRoutes.done);
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryOrangeColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/placingboxes.png')),
          verticalSpace(30),
          CustomProgressIndicator(
            currentStep: _currentStep,
            totalSteps: _totalSteps,
          ),
          verticalSpace(40),
          Text(
            'Processing your order ...',
            style: AppTextStyles.font16W400
                .copyWith(color: AppColors.customWhiteColor),
          )
        ],
      ),
    );
  }
}
