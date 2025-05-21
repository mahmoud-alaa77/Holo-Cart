import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/di.dart';
import 'package:holo_cart/core/helper/my_bloc_observer.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/core/routing/router.dart';
import 'package:holo_cart/core/themes/app_themes.dart';
import 'package:holo_cart/features/dark_and_light_mode/cubit/app_mode_cubit.dart';

bool isLogedInUser = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();

  Bloc.observer = SimpleBlocObserver();
  await checkUserLogin();

  runApp(const MyApp());
}

checkUserLogin() async {
  String userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.token);
  if (userToken.isNotEmpty) {
    isLogedInUser = true;
  } else {
    isLogedInUser = false;
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
          if (state is AppModeDark) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              child: MaterialApp.router(
                routerConfig: router(isLogedInUser),
                debugShowCheckedModeBanner: false,
                title: 'Holo Cart',
                theme: AppTheme.darkMode,
              ),
            );
          } else if (state is AppModeLight) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              child: MaterialApp.router(
                routerConfig: router(isLogedInUser),
                debugShowCheckedModeBanner: false,
                title: 'Holo Cart',
                theme: AppTheme.lightMode,
              ),
            );
          } else {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              child: MaterialApp.router(
                routerConfig: router(isLogedInUser),
                debugShowCheckedModeBanner: false,
                title: 'Holo Cart',
                theme: AppTheme.lightMode,
              ),
            );
          }
        },
      ),
    );
  }
}
