import 'package:test_ios/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void myShowDialog(
  BuildContext context, {
  required Function()? yesTap,
  required Function()? noTap,
}) {
  Alert(
    context: context,
    title: "هل تريد تعديل البيانات الرئيسية",
    buttons: [
      DialogButton(
        onPressed: yesTap,
        color: AppColors.greenColor,
        child: const Text('نعم', style: TextStyle(color: AppColors.whiteColor)),
      ),
      DialogButton(
        onPressed: noTap,
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.greenColor),
        child: const Text('لا', style: TextStyle(color: AppColors.greenColor)),
      ),
    ],
  ).show();
}
