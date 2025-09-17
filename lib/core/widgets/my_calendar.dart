import 'package:test_ios/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyCalendar extends StatelessWidget {
  final DateTime startTrip;
  final DateTime endTrip;
  final int firstDayOfWeek;

  final Widget Function(BuildContext, MonthCellDetails)? monthCellBuilder;
  final Function(CalendarTapDetails)? onTap;
  const MyCalendar({
    super.key,
    required this.startTrip,
    required this.endTrip,
    this.monthCellBuilder,
    this.onTap,
    required this.firstDayOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      backgroundColor: AppColors.backgroundCalendarColor,
      view: CalendarView.month,
      firstDayOfWeek: firstDayOfWeek,
      showNavigationArrow: false,
      monthViewSettings: const MonthViewSettings(
        showTrailingAndLeadingDates: false,
      ),
      selectionDecoration: const BoxDecoration(),
      minDate: startTrip,
      maxDate: startTrip == endTrip
          ? endTrip.add(const Duration(days: 1))
          : endTrip,
      onTap: onTap,
      monthCellBuilder: monthCellBuilder,
      headerStyle: const CalendarHeaderStyle(textAlign: TextAlign.center),
      todayTextStyle: const TextStyle(color: AppColors.mainColor),
    );
  }
}
