import 'package:test_ios/core/widgets/custom_day_card_add_trip.dart';
import 'package:test_ios/core/widgets/job_day_card.dart';
import 'package:test_ios/features/display_trip/presentation/manager/update_trip/update_trip_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:test_ios/core/widgets/custom_default_day_card.dart';

class EditHolidayInTrip extends StatelessWidget {
  const EditHolidayInTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateTripCubit, UpdateTripState>(
      builder: (context, state) {
        UpdateTripCubit cubit = context.read<UpdateTripCubit>();

        return SfCalendar(
          view: CalendarView.month,
          showNavigationArrow: true,
          showDatePickerButton: true,
          monthViewSettings: const MonthViewSettings(
            showTrailingAndLeadingDates: false,
          ),
          selectionDecoration: const BoxDecoration(),
          minDate: cubit.getMinDate(),
          maxDate: cubit.getMaxDate(),
          onTap: (selectedDay) async {
            cubit.selectedDay(selectedDay: selectedDay);
          },
          monthCellBuilder: (context, details) {
            bool isHoliday =
                cubit.holidays.contains(details.date) ||
                cubit.fridayAndSaturdayHoliday.contains(details.date);

            if (isHoliday) {
              return CustomHolidayCardTrip(day: details.date.day.toString());
            } else if (cubit.jobdays.contains(details.date)) {
              return JobDayCard(day: details.date.day);
            } else {
              return CustomDefaultDayCardTrip(day: details.date.day.toString());
            }
          },
        );
      },
    );
  }
}
