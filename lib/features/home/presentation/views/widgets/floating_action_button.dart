import 'package:test_ios/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomFloatingActionButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shadowColor: const MaterialStatePropertyAll(AppColors.lightGrayColor),
          foregroundColor: const MaterialStatePropertyAll(
            AppColors.extraLightGrayColor,
          ),
          elevation: const MaterialStatePropertyAll(4),
          overlayColor: MaterialStatePropertyAll(
            AppColors.mainColor.withOpacity(0.15),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
          ),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 8.w),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            AppColors.buttonGreenColor,
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(Iconsax.add, size: 30), Text('إضافة رحلة')],
        ),
      ),
    );
  }
}
