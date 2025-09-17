import 'package:test_ios/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.onChanged,
    required this.hintText,
    required this.controller,
  });
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textAlign: TextAlign.center,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*[\.,]?\d*')),
      ],
      style: TextStyle(color: AppColors.greentextColor, fontSize: 22.sp),
      cursorColor: AppColors.mainColor,
      decoration: InputDecoration(
        isDense: false,
        labelText: hintText,
        labelStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14.sp),
        floatingLabelStyle: TextStyle(
          color: AppColors.greentextColor,
          fontSize: 18.sp,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
        fillColor: AppColors.whiteColor,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0.r)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0.r),
          borderSide: const BorderSide(color: AppColors.mainColor, width: 2),
        ),
      ),
    );
  }
}
