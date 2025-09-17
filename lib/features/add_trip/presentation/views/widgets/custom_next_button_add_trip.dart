import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class CustomNextButtonAddTrip extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  const CustomNextButtonAddTrip({
    super.key,
    required this.onPressed,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context) * .35,
      child: TextButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColors.greenColor),
        ),
        child: Text(
          text ?? 'التالي',
          style: const TextStyle(color: AppColors.whiteColor, fontSize: 18),
        ),
      ),
    );
  }
}
