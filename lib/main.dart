import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:holo_cart/core/helper/di.dart';
import 'package:holo_cart/core/helper/my_bloc_observer.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/core/networking/api_constants.dart';
import 'package:holo_cart/core/routing/router.dart';
import 'package:holo_cart/core/themes/app_themes.dart';
import 'package:holo_cart/features/dark_and_light_mode/cubit/app_mode_cubit.dart';

bool isLogedInUser = false;
bool isGuestUser = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await setupGetIt();

  Bloc.observer = SimpleBlocObserver();
  // await checkUserLogin();
  Stripe.publishableKey = ApiConstants.publicKey;

  runApp(const MyApp());
}

checkUserLogin() async {
  String userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.token);
  isGuestUser = await SharedPrefHelper.getBool(SharedPrefKeys.isGuest);
  if (userToken.isNotEmpty) {
    isLogedInUser = true;
    isGuestUser = false;
  } else if (isGuestUser) {
    isLogedInUser = false;
    isGuestUser = true;
  } else {
    isLogedInUser = false;
    isGuestUser = false;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppModeCubit(),
      child: BlocBuilder<AppModeCubit, AppModeState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp.router(
              routerConfig: router,
              debugShowCheckedModeBanner: false,
              title: 'Holo Cart',
              theme:
                  state is AppModeDark ? AppTheme.darkMode : AppTheme.lightMode,
            ),
          );

          // if (state is AppModeDark) {
          //   return ScreenUtilInit(
          //     designSize: const Size(360, 690),
          //     minTextAdapt: true,
          //     splitScreenMode: true,
          //     child: MaterialApp.router(
          //       routerConfig: router,
          //       debugShowCheckedModeBanner: false,
          //       title: 'Holo Cart',
          //       theme: AppTheme.darkMode,
          //     ),
          //   );
          // } else if (state is AppModeLight) {
          //   return ScreenUtilInit(
          //     designSize: const Size(360, 690),
          //     minTextAdapt: true,
          //     splitScreenMode: true,
          //     child: MaterialApp.router(
          //       routerConfig: router,
          //       debugShowCheckedModeBanner: false,
          //       title: 'Holo Cart',
          //       theme: AppTheme.lightMode,
          //     ),
          //   );
          // } else {
          //   return ScreenUtilInit(
          //     designSize: const Size(360, 690),
          //     minTextAdapt: true,
          //     splitScreenMode: true,
          //     child: MaterialApp.router(
          //       routerConfig: router,
          //       debugShowCheckedModeBanner: false,
          //       title: 'Holo Cart',
          //       theme: AppTheme.lightMode,
          //     ),
          //   );
          // }
        },
      ),
    );
  }
}
