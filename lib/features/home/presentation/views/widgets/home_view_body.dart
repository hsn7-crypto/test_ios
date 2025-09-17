import 'package:test_ios/core/utils/functions/get_first_day_of_week.dart';
import 'package:test_ios/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:test_ios/features/home/presentation/views/widgets/home_calendar_last_month.dart';
import 'package:test_ios/features/home/presentation/views/widgets/total_and_net_salary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return Padding(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          const TotalAndNetSalaryCard(),
          SizedBox(height: 16.h),
          Text('الرحلة الأخيرة', style: TextStyle(fontSize: 24.sp)),
          Expanded(
            child: HomeCalendarLastMonth(
              initialDisplayDate: cubit.trip.startTripDate,
              firstDayOfWeek: getFirstDayOfWeek(
                year: cubit.trip.startTripDate!.year,
                month: cubit.trip.startTripDate!.month,
              ),
              jobdays: cubit.trip.jobdays,
              holidays: cubit.trip.holidays,
              fridayAndSaturdayHoliday: cubit.trip.fridayAndSaturdayHoliday,
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
