import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/di.dart';
import 'package:holo_cart/core/routing/app_routes.dart';
import 'package:holo_cart/features/cart/logic/cubit/cart_cubit.dart';
import 'package:holo_cart/features/cart/ui/cart_screen_body.dart';
import 'package:holo_cart/features/categories/logic/cubit/get_products_in_category_cubit.dart';
import 'package:holo_cart/features/checkout/ui/checkout_screen.dart';
import 'package:holo_cart/features/checkout/ui/done_screen.dart';
import 'package:holo_cart/features/checkout/ui/proccessing_order_screen.dart';
import 'package:holo_cart/features/favourites/logic/cubit/favourite_cubit.dart';
import 'package:holo_cart/features/forget_password/logic/forget_password/forget_password_cubit.dart';
import 'package:holo_cart/features/forget_password/logic/reset_password/reset_password_cubit.dart';
import 'package:holo_cart/features/forget_password/logic/verify/verification_code_cubit.dart';
import 'package:holo_cart/features/forget_password/ui/forget_password_screen.dart';
import 'package:holo_cart/features/forget_password/ui/reset_password.dart';
import 'package:holo_cart/features/forget_password/ui/verication_code_screen.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:holo_cart/features/home/logic/get_products_by_discount/get_products_by_discount_cubit.dart';
import 'package:holo_cart/features/home/logic/discounts/discounts_cubit.dart';
import 'package:holo_cart/features/home/logic/get_all_categories/get_categories_cubit.dart';
import 'package:holo_cart/features/home/logic/get_all_products/get_all_products_cubit.dart';
import 'package:holo_cart/features/home/logic/product_by_id/get_product_by_id_cubit.dart';
import 'package:holo_cart/features/home/ui/all_products_in_category_screen.dart';
import 'package:holo_cart/features/home/ui/main_screen.dart';
import 'package:holo_cart/features/login/logic/cubit/login_cubit.dart';
import 'package:holo_cart/features/login/ui/login_screen.dart';
import 'package:holo_cart/features/login_or_signup_guest/ui/login_signup_guest_screen.dart';
import 'package:holo_cart/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:holo_cart/features/product_details/logic/cubit/get_product_colors_cubit.dart';
import 'package:holo_cart/features/product_details/ui/product_details_page.dart';
import 'package:holo_cart/features/profile/data/model/get_profile_model/profile_response_model.dart';
import 'package:holo_cart/features/profile/logic/get_profile/userprofile_cubit.dart';
import 'package:holo_cart/features/profile/logic/update_profile/update_profile_cubit.dart';
import 'package:holo_cart/features/profile/ui/profile_screen_body.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/creat_shipping_address/shipping_address_cubit.dart';
import 'package:holo_cart/features/profile/ui/views/address/logic/get_shipping_address/get_shipping_address_cubit.dart';
import 'package:holo_cart/features/profile/ui/views/address/ui/address_screen.dart';
import 'package:holo_cart/features/profile/ui/views/address/ui/edit_adresses_screen.dart';
import 'package:holo_cart/features/profile/ui/views/payment/add_card_screen.dart';
import 'package:holo_cart/features/profile/ui/views/payment/payment_screen.dart';
import 'package:holo_cart/features/profile/ui/views/update_information_user/update_user_profile.dart';
import 'package:holo_cart/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:holo_cart/features/sign_up/ui/sign_up_screen.dart';
import 'package:holo_cart/features/splash/splash_screen.dart';
import 'package:holo_cart/main.dart';

import '../../features/profile/ui/views/address/data/models/display_shipping_address/get_address_response_model.dart';

final router = GoRouter(
  initialLocation: AppRoutes.splash, // Always start from splash
  // redirect: (context, state) {
  //   // If user is not logged in
  //   if (!isLogedInUser) {
  //     // Allow access to splash, onboarding, login, signup, mainAuth, and forget password screens
  //     final allowedPaths = [
  //       AppRoutes.splash,
  //       AppRoutes.onBoarding,
  //       AppRoutes.login,
  //       AppRoutes.signUp,
  //       AppRoutes.mainAuth,
  //       AppRoutes.forgetPassword,
  //       AppRoutes.verificationCode,
  //       AppRoutes.resetPassword,
  //     ];
      
  //     if (!allowedPaths.contains(state.matchedLocation)) {
  //       return AppRoutes.splash; // Redirect to splash if trying to access protected routes
  //     }
  //   } else {
  //     // If user is logged in, redirect from auth screens to main screen
  //     final authPaths = [
  //       AppRoutes.splash,
  //       AppRoutes.login,
  //       AppRoutes.signUp,
  //       AppRoutes.mainAuth,
  //     ];
      
  //     if (authPaths.contains(state.matchedLocation)) {
  //       return AppRoutes.main; // Redirect to main screen if trying to access auth screens
  //     }
  //   }

  //   return null; // Allow access to the requested route
  // },
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
      builder: (context, state) {
        

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt<GetCategoriesCubit>()..getCategories(),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<GetAllProductsCubit>()..getAllProducts(),
              ),
              BlocProvider(
                create: (context) => getIt<DiscountsCubit>()..getAllDiscounts(),
              ),
              BlocProvider(
                create: (context) => getIt<GetProductsByDiscountCubit>()
                  ..getProductsByDiscount("10"),
              ),
              BlocProvider(
                create: (context) => getIt<GetProductsInCategoryCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<GetProductColorsCubit>(),
              ),
              BlocProvider(
                create: (context) => CartCubit()..getCartItems(),
              ),
              BlocProvider(
                create: (context) => getIt<FavouriteCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<GetProductByIdCubit>(),
              ),
            ],
            child: const MainScreen(),
          );
        }),
    GoRoute(
      path: AppRoutes.productDetails,
      builder: (context, state) {
        final data = state.extra as ProductData;
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<GetProductColorsCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<GetProductsInCategoryCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<FavouriteCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<GetAllProductsCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<LoginCubit>(),
            ),
          ],
          child: ProductDetailsPage(
            product: data,
          ),
        );
      },
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
    // GoRoute(
    //   path: AppRoutes.cartScreen,
    //   builder: (context, state) => const CartScreen(),
    // ),
    
    GoRoute(
      path: AppRoutes.emptycartScreen,
      builder: (context, state) => CartScreenBody(),
    ),
    GoRoute(
      path: AppRoutes.checkout,
      builder: (context, state) => const CheckoutScreen(),
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
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<ForgetPasswordCubit>(),
        child: const ForgetPasswordScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.profilePayment,
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: AppRoutes.verificationCode,
      builder: (context, state) {
        final email = state.extra as String;
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<ForgetPasswordCubit>()),
            BlocProvider(create: (_) => getIt<VerificationCodeCubit>()),
          ],
          child: VerificationCodeScreen(email: email),
        );
      },
    ),

    GoRoute(
        path: AppRoutes.resetPassword,
        builder: (context, state) {
          // استخدام ؟؟ للتحقق من وجود قيمة وتوفير قيمة افتراضية
          final email = (state.extra as String?) ?? "";

          return MultiBlocProvider(providers: [
            BlocProvider(create: (_) => getIt<ResetPasswordCubit>()),
          ], child: ResetPasswordScreen(email: email));
        }),

    GoRoute(
        path: AppRoutes.allProductsInCategory,
        builder: (context, state) {
          final List<dynamic> idAndName = state.extra as List<dynamic>;
          return BlocProvider(
            create: (context) => getIt<GetProductsInCategoryCubit>(),
            child: AllProductsInCategoryScreen(
              idAndName: idAndName,
            ),
          );
        }),
    GoRoute(
      path: AppRoutes.userProfile,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => getIt<UserProfileCubit>()..getUserProfile(),
          child: const ProfileScreenBody(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.updateUserProfile,
      builder: (context, state) {
        final user = state.extra as UserProfileModel;

        return BlocProvider(
          create: (_) => getIt<UpdateProfileCubit>()..loadInitialData(user),
          child: const UpdateUserProfile(),
        );
      },
    ),
   GoRoute(
      path: AppRoutes.address,
      builder: (context, state) => BlocProvider(
        create: (context) =>
            getIt<GetShippingAddressCubit>()..fetchShippingAddress(),
        child: AddressScreen(),
      ),
    ),
   GoRoute(
  path: AppRoutes.addNewAddress,
  builder: (context, state) {
    final extra = state.extra as Map<String, dynamic>?;

    final isEdit = extra?['isEdit'] as bool? ?? false;
    final content = extra?['content'] as ShippingAddressContentModel?;
    final getCubit = extra?['getCubit'] as GetShippingAddressCubit;

    return MultiBlocProvider(
      providers: [
        // كيوبت التعديل/إنشاء
        BlocProvider(
          create: (_) => getIt<ShippingAddressCubit>()..loadInitialData(content),
        ),
        // كيوبت الجلب (عشان الـ BlocListener يلاقيه)
        BlocProvider.value(value: getCubit),
      ],
      child: EditAndCreateAddressScreen(isEdit: isEdit, content: content, getCubit: getCubit),
    );
  },
),





  ],
);
