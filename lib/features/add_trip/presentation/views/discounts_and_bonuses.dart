import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/core/widgets/my_text_field.dart';
import 'package:test_ios/features/add_trip/presentation/manager/trip_data/trip_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountsAndBonusesScreen extends StatelessWidget {
  const DiscountsAndBonusesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TripDataCubit cubit = context.read<TripDataCubit>();
    return ListView.builder(
      padding: EdgeInsets.only(top: 32.h, right: 16.w, left: 16.w),
      itemCount: cubit.monthCount(),
      itemBuilder: (context, index) {
        bool isFirstMonth = index == 0;

        return Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'شهر ${isFirstMonth ? cubit.tripData.startTripDate!.month : cubit.tripData.endTripDate!.month}',
                style: const TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 32.h),
            MyTextField(
              hintText: 'علاوات',
              controller: isFirstMonth
                  ? cubit.bonusesFirstMonthTextController
                  : cubit.bonusesSecondMonthTextController,
            ),
            SizedBox(height: 16.h),
            MyTextField(
              hintText: 'خصومات',
              controller: isFirstMonth
                  ? cubit.discountsFirstMonthTextController
                  : cubit.discountsSecondMonthTextController,
            ),
            SizedBox(height: 32.h),
          ],
        );
      },
    );
  }
}
