

import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/routing/routes.dart';
import 'package:holo_cart/features/login/ui/login_screen.dart';
import 'package:holo_cart/features/login_or_signup_guest/ui/login_signup_guest_screen.dart';
import 'package:holo_cart/features/on_boarding/ui/on_boarding_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: Routes.onBoarding,
    builder: (context, state) => const OnBoardingScreen(),
  ),
  GoRoute(
    path: Routes.login,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: Routes.mainAuth,
    builder: (context, state) => const LoginORSignupORGuestScreen(),
  ),
]);