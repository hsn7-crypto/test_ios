import 'package:test_ios/core/utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastSuccess({required String msg}) async {
  await Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.mainColor,
    textColor: AppColors.whiteColor,
    fontSize: 16.0,
  );
}

void showToastInfo({required String msg}) async {
  await Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.blueColor,
    textColor: AppColors.whiteColor,
    fontSize: 16.0,
  );
}
