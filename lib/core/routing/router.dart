import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/features/home/ui/main_screen.dart';
import 'package:holo_cart/features/login/ui/login_screen.dart';
import 'package:holo_cart/features/login_or_signup_guest/ui/login_signup_guest_screen.dart';
import 'package:holo_cart/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:holo_cart/features/product_details/ui/product_details_page.dart';
import 'package:holo_cart/features/search/ui/search_screen.dart';
import 'package:holo_cart/features/profile/payment/add_card_screen.dart';
import 'package:holo_cart/features/profile/payment/payment_screen.dart';
import 'package:holo_cart/features/sign_up/ui/sign_up_screen.dart';
import 'package:holo_cart/features/splash/splash_screen.dart';

final router = GoRouter(
  routes: [
    // Splash Route
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    // Onboarding Route with Custom Slide Transition
    GoRoute(
      path: AppRoutes.onBoarding,
      name: "on_boarding",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const OnBoardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    // Login Route
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    // Main Auth Route
    GoRoute(
      path: AppRoutes.mainAuth,
      builder: (context, state) => const LoginORSignupORGuestScreen(),
    ),
    //signup route
    GoRoute(
      path: AppRoutes.signUp,
      builder: (context, state) => const SignUpScreen(),
    ),
    // Home Route
    GoRoute(
      path: AppRoutes.main,
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: AppRoutes.productDetails,
      builder: (context, state) => const ProductDetailsPage(),
    ),

    // serach Route
    GoRoute(
      path: AppRoutes.search,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: AppRoutes.profilePayment,
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: AppRoutes.cardNumber,
      builder: (context, state) {
        final controllers = (state.extra is List<TextEditingController>)
            ? state.extra as List<TextEditingController>
            : <TextEditingController>[];

        return AddCardScreen(controller: controllers);
      },
    ),
  ],
);
