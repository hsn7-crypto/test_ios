import 'package:test_ios/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDefaultDayCardTrip extends StatelessWidget {
  const CustomDefaultDayCardTrip({
    super.key,
    required this.day,
    this.backGroundColor,
    this.textColor,
  });

  final String day;
  final Color? backGroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 1.h, bottom: 1.h, left: 1.w, right: 1.w),
      decoration: BoxDecoration(
        color:
            backGroundColor ?? AppColors.extraLightGrayColor, //Colors.black12,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        day.toString(),
        style: TextStyle(
          color: textColor ?? AppColors.lightBlackColor, //Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
