import 'package:test_ios/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalAndNetSalaryItem extends StatelessWidget {
  final String text;
  final double salary;
  const TotalAndNetSalaryItem({
    super.key,
    required this.text,
    required this.salary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.backgroundGreenColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            '${salary.toStringAsFixed(3)} \$',
            style: const TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
