import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/themes/app_text_styles.dart';
import 'package:holo_cart/features/categories/ui/categories_screen_body.dart';
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
    const CategoriesScreenBody(),
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
        body: Stack(
          children: [
            bodies[selectedIndex],
            Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: _buildBottomNavigationBar())
          ],
        ),
        //bottomNavigationBar: _buildBottomNavigationBar()
      ),
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
          items: List.generate(5, (index) {
            return BottomNavigationBarItem(
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  if (selectedIndex == index)
                    Container(
                      width: 40.r,
                      height: 40.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryOrangeColor
                                .withValues(alpha: .5),
                            blurRadius: 12.r,
                            spreadRadius: 5.r,
                          ),
                        ],
                      ),
                    ),
                  Icon(_getIcon(index, isActive: false)),
                ],
              ),
              activeIcon: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryOrangeColor
                              .withValues(alpha: .45),
                          blurRadius: 16.r,
                          spreadRadius: 6.r,
                        ),
                      ],
                    ),
                  ),
                  Icon(_getIcon(index, isActive: true)),
                ],
              ),
              label: '',
            );
          }),
        ),
      ),
    );
  }

  IconData _getIcon(int index, {required bool isActive}) {
    switch (index) {
      case 0:
        return isActive ? Icons.home_filled : Icons.home_sharp;
      case 1:
        return isActive ? Icons.category_rounded : Icons.category_outlined;
      case 2:
        return isActive ? Icons.favorite : Icons.favorite_border;
      case 3:
        return isActive
            ? Icons.shopping_basket_sharp
            : Icons.shopping_basket_outlined;
      case 4:
        return isActive ? Icons.person : Icons.person_outline_rounded;
      default:
        return Icons.help_outline;
    }
  }
}
