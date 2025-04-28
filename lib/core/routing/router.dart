import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/di.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/features/cart/ui/cart_empty_screen.dart';
import 'package:holo_cart/features/cart/ui/cart_screen.dart';
import 'package:holo_cart/features/checkout/ui/checkout_screen.dart';
import 'package:holo_cart/features/checkout/ui/done_screen.dart';
import 'package:holo_cart/features/checkout/ui/proccessing_order_screen.dart';
import 'package:holo_cart/features/forget_password/ui/forget_password_screen.dart';
import 'package:holo_cart/features/forget_password/ui/reset_password.dart';
import 'package:holo_cart/features/forget_password/ui/verication_code_screen.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:holo_cart/features/home/logic/get_all_categories/get_categories_cubit.dart';
import 'package:holo_cart/features/home/logic/get_all_products/get_all_products_cubit.dart';
import 'package:holo_cart/features/home/ui/main_screen.dart';
import 'package:holo_cart/features/login/logic/cubit/login_cubit.dart';
import 'package:holo_cart/features/login/ui/login_screen.dart';
import 'package:holo_cart/features/login_or_signup_guest/ui/login_signup_guest_screen.dart';
import 'package:holo_cart/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:holo_cart/features/product_details/ui/product_details_page.dart';
import 'package:holo_cart/features/profile/address/address_screen.dart';
import 'package:holo_cart/features/profile/payment/add_card_screen.dart';
import 'package:holo_cart/features/profile/payment/payment_screen.dart';
import 'package:holo_cart/features/sign_up/logic/cubit/sign_up_cubit.dart';
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
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<LoginCubit>(),
  
        child: const LoginScreen(),
      ),
    ),
    // Main Auth Route
    GoRoute(
      path: AppRoutes.mainAuth,
      builder: (context, state) => const LoginORSignupORGuestScreen(),
    ),
    //signup route
    GoRoute(
      path: AppRoutes.signUp,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<SignUpCubit>(),
        child: const SignUpScreen(),
      ),
    ),
    // Home Route
    GoRoute(
      path: AppRoutes.main,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<GetCategoriesCubit>()..getCategories(),
          ),
          BlocProvider(
            create: (context) => getIt<GetAllProductsCubit>()..getAllProducts(),
          ),
        ],
        child: const MainScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.productDetails,
      builder: (context, state) {
        final data = state.extra as ProductData;
        return ProductDetailsPage(
          product: data,
        );
      },
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
    GoRoute(
      path: AppRoutes.cartScreen,
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: AppRoutes.emptycartScreen,
      builder: (context, state) => const CartEmptyScreen(),
    ),
    GoRoute(
      path: AppRoutes.checkout,
      builder: (context, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: AppRoutes.address,
      builder: (context, state) => const AddressScreen(),
    ),
    GoRoute(
      path: AppRoutes.proccessingOrder,
      builder: (context, state) => const ProccessingOrderScreen(),
    ),
    GoRoute(
      path: AppRoutes.done,
      builder: (context, state) => const DoneScreen(),
    ),
    GoRoute(
      path: AppRoutes.forgetPassword,
      builder: (context, state) => const ForgetPasswordScreen(),
    ),
     GoRoute(
      path: AppRoutes.verificationCode,
      builder: (context, state) => const VericationCodeScreen(),
    ),
     GoRoute(
      path: AppRoutes.resetPassword,
      builder: (context, state) => const ResetPassword(),
    ),
  ],
);
