import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/core/widgets/custom_day_card_add_trip.dart';
import 'package:test_ios/core/widgets/custom_default_day_card.dart';
import 'package:test_ios/core/widgets/job_day_card.dart';
import 'package:test_ios/core/widgets/my_calendar_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeCalendarLastMonth extends StatelessWidget {
  final List<DateTime> jobdays;
  final List<DateTime> fridayAndSaturdayHoliday;
  final List<DateTime> holidays;
  final DateTime? initialDisplayDate;
  final int firstDayOfWeek;
  const HomeCalendarLastMonth({
    super.key,
    required this.jobdays,
    required this.fridayAndSaturdayHoliday,
    required this.holidays,
    required this.initialDisplayDate,
    required this.firstDayOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    return MyCalendarCard(
      child: SfCalendar(
        backgroundColor: AppColors.backgroundCalendarColor,
        viewNavigationMode: ViewNavigationMode.none,
        view: CalendarView.month,
        firstDayOfWeek: firstDayOfWeek,
        todayHighlightColor: AppColors.mainColor,
        initialDisplayDate: initialDisplayDate,
        selectionDecoration: const BoxDecoration(),
        monthViewSettings: const MonthViewSettings(
          showTrailingAndLeadingDates: false,
        ),
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
          textStyle: TextStyle(fontSize: 20.sp),
        ),
        monthCellBuilder: (context, details) {
          bool isHoliday =
              holidays.contains(details.date) ||
              fridayAndSaturdayHoliday.contains(details.date);

          if (isHoliday) {
            return CustomHolidayCardTrip(day: details.date.day.toString());
          } else if (jobdays.contains(details.date)) {
            return JobDayCard(day: details.date.day);
          } else {
            return CustomDefaultDayCardTrip(day: details.date.day.toString());
          }
        },
      ),
    );
  }
}
