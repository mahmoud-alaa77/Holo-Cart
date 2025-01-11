import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/routing/routes.dart';
import 'package:holo_cart/features/login/ui/login_screen.dart';
import 'package:holo_cart/features/login_or_signup_guest/ui/login_signup_guest_screen.dart';
import 'package:holo_cart/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:holo_cart/features/sign_up/ui/sign_up_screen.dart';
import 'package:holo_cart/features/splash/splash_screen.dart';

final router = GoRouter(
  routes: [
    // Splash Route
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    // Onboarding Route with Custom Slide Transition
    GoRoute(
      path: Routes.onBoarding,
      name: "on_boarding",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const OnBoardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), // Slide in from the right
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
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    // Main Auth Route
    GoRoute(
      path: Routes.mainAuth,
      builder: (context, state) => const LoginORSignupORGuestScreen(),
    ),
     GoRoute(
      path: Routes.signUp,
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);
