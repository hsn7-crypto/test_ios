import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/core/utils/app_size.dart';
import 'package:test_ios/core/utils/app_router.dart';
import 'package:test_ios/core/utils/functions/get_first_day_of_week.dart';
import 'package:test_ios/core/widgets/custom_default_day_card.dart';
import 'package:test_ios/core/widgets/job_day_card.dart';
import 'package:test_ios/core/widgets/my_calendar.dart';
import 'package:test_ios/core/widgets/my_calendar_card.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:test_ios/core/widgets/custom_day_card_add_trip.dart';
import 'package:test_ios/features/display_trip/presentation/views/widgets/custom_card_net_salary.dart';
import 'package:test_ios/features/display_trip/presentation/views/widgets/custom_edit_button.dart';
import 'package:test_ios/features/display_trip/presentation/views/widgets/more_details_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DataTripMonthView extends StatelessWidget {
  final TripDataEntity tripData;
  final int index;
  const DataTripMonthView({
    super.key,
    required this.tripData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 16.h),
      child: Column(
        children: [
          Container(
            width: width(context),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(color: AppColors.mainColor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Column(
              children: [
                CustomDisplayNetSalaryCard(
                  title: 'صافي الراتب',
                  count: tripData.netSalary.toStringAsFixed(3),
                  textColor: AppColors.blackColor,
                  valueColor: AppColors.lightBlackColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 56.h),
          Expanded(
            child: Stack(
              children: [
                MyCalendarCard(
                  child: MyCalendar(
                    startTrip: tripData.startTripDate!,
                    endTrip: tripData.endTripDate!,
                    firstDayOfWeek: getFirstDayOfWeek(
                      year: tripData.startTripDate!.year,
                      month: tripData.startTripDate!.month,
                    ),
                    monthCellBuilder: (context, details) {
                      bool isHoliday = tripData.holidays.contains(details.date);
                      bool isFridayAndSaturday = tripData
                          .fridayAndSaturdayHoliday
                          .contains(details.date);
                      bool isJobDay = tripData.jobdays.contains(details.date);

                      if (isHoliday || isFridayAndSaturday) {
                        return CustomHolidayCardTrip(
                          day: details.date.day.toString(),
                        );
                      } else if (isJobDay) {
                        return JobDayCard(day: details.date.day);
                      } else {
                        return CustomDefaultDayCardTrip(
                          day: details.date.day.toString(),
                        );
                      }
                    },
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: CustomEditButton(
                    onPressed: () {
                      GoRouter.of(
                        context,
                      ).push(AppRouter.editTripView, extra: index);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: MoreDetailsButton(
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).push(AppRouter.detailsTripView, extra: tripData);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
