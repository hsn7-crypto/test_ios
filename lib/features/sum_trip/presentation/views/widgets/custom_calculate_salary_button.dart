import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class CustomCalculateSalaryButton extends StatelessWidget {
  final String txt;
  final void Function()? onPressed;
  const CustomCalculateSalaryButton({
    super.key,
    required this.txt,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(context) * 0.2),
      child: MaterialButton(
        textColor: AppColors.whiteColor,
        onPressed: onPressed,
        color: AppColors.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          txt,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
