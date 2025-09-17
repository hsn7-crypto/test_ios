import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class CustomPreviousButtonAddTrip extends StatelessWidget {
  final void Function()? onPressed;
  const CustomPreviousButtonAddTrip({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context) * .35,
      child: TextButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          side: MaterialStatePropertyAll(
            BorderSide(color: AppColors.greenColor),
          ),
        ),
        child: const Text(
          'السابق',
          style: TextStyle(color: AppColors.greenColor, fontSize: 18),
        ),
      ),
    );
  }
}
