import 'package:test_ios/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomEditButton extends StatelessWidget {
  const CustomEditButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(shape: MaterialStatePropertyAll(CircleBorder())),
      child: const Icon(Iconsax.edit, color: AppColors.greenColor),
    );
  }
}
