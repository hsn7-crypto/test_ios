import 'package:test_ios/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:iconsax/iconsax.dart';

class MySnakeNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemSelected;
  const MySnakeNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      snakeShape: SnakeShape.indicator.copyWith(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
      ),
      snakeViewColor: AppColors.mainColor,
      selectedItemColor: AppColors.mainColor,
      unselectedItemColor: AppColors.lightGreenColor,
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      showSelectedLabels: true,
      elevation: 10,
      selectedLabelStyle: TextStyle(fontSize: 12.sp),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Iconsax.calculator),
          activeIcon: Icon(Iconsax.calculator5),
          label: 'حساب ترب',
        ),
        BottomNavigationBarItem(icon: Icon(Iconsax.home4), label: 'الرئيسية'),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.calendar_1),
          label: 'التقويم',
        ),
      ],
    );
  }
}
