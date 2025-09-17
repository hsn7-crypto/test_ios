import 'package:test_ios/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHolidayCardTrip extends StatelessWidget {
  const CustomHolidayCardTrip({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 1.h, bottom: 1.h, left: 1.w, right: 1.w),
      decoration: BoxDecoration(
        color: AppColors
            .holiDayColor, //AppColors.holidayCardColor, //AppColors.redColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        day,
        style: TextStyle(
          color: AppColors.lightBlackColor, //AppColors.whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
