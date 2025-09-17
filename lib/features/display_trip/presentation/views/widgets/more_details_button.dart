import 'package:test_ios/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MoreDetailsButton extends StatelessWidget {
  final Function()? onTap;
  const MoreDetailsButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const Text(
        'المزيد من التفاصيل',
        style: TextStyle(color: AppColors.blueColor, fontSize: 18),
      ),
    );
  }
}
