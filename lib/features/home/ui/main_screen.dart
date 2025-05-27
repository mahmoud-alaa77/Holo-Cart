import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/di.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/features/cart/logic/cubit/cart_cubit.dart';
import 'package:holo_cart/features/cart/ui/cart_screen_body.dart';
import 'package:holo_cart/features/categories/ui/categories_screen_body.dart';
import 'package:holo_cart/features/favourites/logic/cubit/favourite_cubit.dart';
import 'package:holo_cart/features/favourites/ui/favourite_screen_body.dart';
import 'package:holo_cart/features/home/ui/home_screen_body.dart';
import 'package:holo_cart/features/login/logic/cubit/login_cubit.dart';
import 'package:holo_cart/features/profile/logic/get_profile/userprofile_cubit.dart';
import 'package:holo_cart/features/profile/ui/profile_screen_body.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> bodies = [
    const HomeScreenBody(),
    const CategoriesScreenBody(),
    BlocProvider(
      create: (context) => getIt<FavouriteCubit>()
        ..getAllFavouriteProducts(id: getIt<LoginCubit>().currentUserId),
      child: const FavouriteScreenBody(),
    ),
    CartScreenBody(),
    BlocProvider(
      create: (_) => getIt<UserProfileCubit>()..getUserProfile(),
      child: const ProfileScreenBody(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: bodies[selectedIndex],
        bottomNavigationBar: SalomonBottomBar(
          backgroundColor: AppColors.customBlackColor,
          currentIndex: selectedIndex,
          onTap: (i) => setState(() {
            selectedIndex = i;
            if (selectedIndex == 3) {
              BlocProvider.of<CartCubit>(context).getCartItems();
            }
          }),
          items: [
            SalomonBottomBarItem(
              icon: Image.asset(
                _getIcon(0, isActive: false),
                width: 20.w,
              ),
              activeIcon: Image.asset(
                _getIcon(0, isActive: true),
                width: 25.w,
              ),
              title: Text(_getLabel(0)),
              selectedColor: AppColors.primaryOrangeColor,
              unselectedColor: AppColors.primaryOrangeColor,
            ),
            SalomonBottomBarItem(
              icon: Image.asset(
                _getIcon(1, isActive: false),
                width: 20.w,
              ),
              activeIcon: Image.asset(
                _getIcon(1, isActive: true),
                width: 25.w,
              ),
              title: Text(_getLabel(1)),
              selectedColor: AppColors.primaryOrangeColor,
              unselectedColor: AppColors.primaryOrangeColor,
            ),
            SalomonBottomBarItem(
              icon: Image.asset(
                _getIcon(2, isActive: false),
                width: 20.w,
              ),
              activeIcon: Image.asset(
                _getIcon(2, isActive: true),
                width: 25.w,
              ),
              title: Text(_getLabel(2)),
              selectedColor: AppColors.primaryOrangeColor,
              unselectedColor: AppColors.customBlackColor,
            ),
            SalomonBottomBarItem(
              icon: Image.asset(
                _getIcon(3, isActive: false),
                width: 20.w,
              ),
              activeIcon: Image.asset(
                _getIcon(3, isActive: true),
                width: 25.w,
              ),
              title: Text(_getLabel(3)),
              selectedColor: AppColors.primaryOrangeColor,
              unselectedColor: AppColors.primaryOrangeColor,
            ),
            SalomonBottomBarItem(
              icon: Image.asset(
                _getIcon(4, isActive: false),
                width: 20.w,
              ),
              activeIcon: Image.asset(
                _getIcon(4, isActive: true),
                width: 25.w,
              ),
              title: Text(_getLabel(4)),
              selectedColor: AppColors.primaryOrangeColor,
              unselectedColor: AppColors.primaryOrangeColor,
            ),
          ],
        ),
      ),
    );
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Categories";
      case 2:
        return "Favorites";
      case 3:
        return "Cart";
      case 4:
        return "Profile";
      default:
        return "";
    }
  }

  _getIcon(int index, {required bool isActive}) {
    switch (index) {
      case 0:
        return isActive
            ? "assets/icons/active_home.png"
            : "assets/icons/home.png";
      case 1:
        return isActive
            ? "assets/icons/active_category.png"
            : "assets/icons/category.png";
      case 2:
        return isActive
            ? "assets/icons/active_fav.png"
            : "assets/icons/favourite.png";
      case 3:
        return isActive
            ? "assets/icons/active_cart.png"
            : "assets/icons/cart.png";

      case 4:
        return isActive
            ? "assets/icons/active_profile.png"
            : "assets/icons/profile.png";
      default:
        return Icons.help_outline;
    }
  }
}
