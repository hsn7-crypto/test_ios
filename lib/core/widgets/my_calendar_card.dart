import 'package:test_ios/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCalendarCard extends StatelessWidget {
  const MyCalendarCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 3.w, right: 3.w, bottom: 3.h, top: 3.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundCalendarColor,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.mainColor,
            blurRadius: 1.5,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: child,
    );
  }
}
