import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
// ...existing code...

@override
void initState() {
  super.initState();
  Future.delayed(const Duration(seconds: 5), () async {
    bool finished = await SharedPrefHelper.getBool('onBoardingFinished');
    bool isGuest = await SharedPrefHelper.getBool(SharedPrefKeys.isGuest);
    String userToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.token);

    if (!finished) {
      GoRouter.of(context).go(AppRoutes.onBoarding);
    } else if (userToken.isNotEmpty) {
      GoRouter.of(context).go(AppRoutes.main);
    }  else {
      GoRouter.of(context).go(AppRoutes.mainAuth);
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Image.asset(
          "assets/images/splash.gif",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
