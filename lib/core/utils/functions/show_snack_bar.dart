import 'package:test_ios/core/utils/app_assets.dart';
import 'package:test_ios/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showSnackBarSuccess(BuildContext context, {required String message}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: message,
      backgroundColor: AppColors.greenColor,
      textAlign: TextAlign.start,
      iconRotationAngle: 0,
      icon: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        child: Lottie.asset(AppAssets.success, repeat: false),
      ),

      /*
      const Icon(
        Icons.done,
        size: 120,
        color: Color(0x15000000),
      ),
      */
    ),
  );
}

void showSnackBarError(BuildContext context, {required String message}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(message: message, textAlign: TextAlign.start),
  );
}

void showSnackBarInfo(BuildContext context, {required String message}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.info(
      message: message,
      textAlign: TextAlign.start,
      backgroundColor: AppColors.snackBarInfoColor.withOpacity(0.9),
      textStyle: const TextStyle(color: AppColors.blackColor),
      iconRotationAngle: 0,
      icon: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        child: Lottie.asset(AppAssets.info, repeat: false),
      ),
      /*
      const Icon(
        Iconsax.information,
        size: 120,
        color: Color(0x15000000),
      ),
      */
    ),
  );
}
