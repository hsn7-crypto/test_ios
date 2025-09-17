import 'package:test_ios/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      elevation: 10,
      onTap: onTap,
      fixedColor: AppColors.mainColor,
      backgroundColor: Colors.white,
      selectedFontSize: 14,
      showUnselectedLabels: false,
      iconSize: 25,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Iconsax.calculator, color: Colors.grey.shade700),
          label: 'حساب ترب',
          activeIcon: const Icon(
            Iconsax.calculator5,
            color: AppColors.mainColor,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.home4, color: Colors.grey.shade700),
          label: 'الرئيسية',
          activeIcon: const Icon(Iconsax.home_15, color: AppColors.mainColor),
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.calendar_1, color: Colors.grey.shade700),
          label: 'التقويم',
          activeIcon: const Icon(Iconsax.calendar5, color: AppColors.mainColor),
        ),
      ],
    );
  }
}
