import 'package:test_ios/core/widgets/custom_default_day_card.dart';
import 'package:test_ios/core/widgets/job_day_card.dart';
import 'package:test_ios/features/add_trip/presentation/manager/trip_data/trip_data_cubit.dart';
import 'package:test_ios/core/widgets/custom_day_card_add_trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AddHolidayInTrip extends StatelessWidget {
  const AddHolidayInTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h, bottom: 6.h, right: 8.w, left: 8.w),
      child: BlocBuilder<TripDataCubit, TripDataState>(
        builder: (context, state) {
          TripDataCubit cubit = context.read<TripDataCubit>();

          return SfCalendar(
            view: CalendarView.month,
            showNavigationArrow: true,
            showDatePickerButton: false,
            monthViewSettings: const MonthViewSettings(
              showTrailingAndLeadingDates: false,
            ),
            minDate: cubit.tripData.startTripDate,
            maxDate: cubit.tripData.endTripDate,
            selectionDecoration: const BoxDecoration(),
            headerStyle: const CalendarHeaderStyle(textAlign: TextAlign.center),
            onTap: (selectedDay) {
              cubit.selectedDay(selectedDay: selectedDay);
            },
            monthCellBuilder: (context, details) {
              //cubit.addFridayOrSaturdayDays(details);

              if (cubit.holidays.contains(details.date) ||
                  cubit.fridayAndSaturdayHoliday.contains(details.date)) {
                return CustomHolidayCardTrip(day: details.date.day.toString());
              } else if (cubit.jobdays.contains(details.date)) {
                return JobDayCard(day: details.date.day);
              }
              // bool isHoliday = cubit.isHoliday(details);
              // if (isHoliday) {
              //   return CustomHolidayCardTrip(
              //     day: details.date.day.toString(),
              //   );
              // } else if (cubit.tripData.jobdays.contains(details.date)) {
              //   return JobDayCard(
              //     day: details.date.day,
              //   );
              // }

              return CustomDefaultDayCardTrip(day: details.date.day.toString());
            },
          );
        },
      ),
    );
  }
}
