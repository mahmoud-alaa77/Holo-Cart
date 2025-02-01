import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/home/ui/home_screen_body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> bodies = [
    const HomeScreenBody(),
    Center(
      child: Text(
        'Categories Screen',
        style: AppTextStyles.font24W900,
      ),
    ),
    Center(
      child: Text(
        'Favorites Screen',
        style: AppTextStyles.font24W900,
      ),
    ),
    Center(
      child: Text(
        'Cart Screen',
        style: AppTextStyles.font24W900,
      ),
    ),
    Center(
      child: Text(
        'Profile Screen',
        style: AppTextStyles.font24W900,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: bodies[selectedIndex],
          bottomNavigationBar: _buildBottomNavigationBar()),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          iconSize: 26.r,
          currentIndex: selectedIndex,
          selectedItemColor: AppColors.primaryOrangeColor,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          backgroundColor: Colors.black.withValues(alpha: .666),
          unselectedItemColor: AppColors.customWhiteColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_sharp),
                label: '',
                activeIcon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: '',
                activeIcon: Icon(Icons.category_rounded)),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: '',
                activeIcon: Icon(Icons.favorite)),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_outlined),
                label: '',
                activeIcon: Icon(Icons.shopping_basket_sharp)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded),
                label: '',
                activeIcon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}


/*
ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: BottomNavigationBar(
            selectedItemColor: AppColors.primaryOrangeColor,
            currentIndex: selectedIndex,
            onTap: _onItemTapped,
            elevation: 0,
            backgroundColor: Colors.black,
            selectedFontSize: 14.sp,
            unselectedFontSize: 12.sp,
            iconSize: 25.r,
            type: BottomNavigationBarType.shifting,
            unselectedItemColor: AppColors.customWhiteColor,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper),
                label: 'News',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
            ],
          ),
        ),*/


