import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/core/widgets/custom_default_day_card.dart';
import 'package:test_ios/core/widgets/my_calendar_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EmptyCalendar extends StatelessWidget {
  const EmptyCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 98.h, right: 16.w, left: 16),
      child: MyCalendarCard(
        child: SfCalendar(
          viewNavigationMode: ViewNavigationMode.none,
          view: CalendarView.month,
          firstDayOfWeek: 5,
          todayHighlightColor: AppColors.mainColor,
          selectionDecoration: const BoxDecoration(),
          headerStyle: const CalendarHeaderStyle(textAlign: TextAlign.center),
          monthCellBuilder: (context, details) {
            if (details.date.day == DateTime.now().day &&
                details.date.month == DateTime.now().month) {
              return CustomDefaultDayCardTrip(
                day: details.date.day.toString(),
                backGroundColor: AppColors.mainColor.withOpacity(0.4),
              );
            }
            return CustomDefaultDayCardTrip(day: details.date.day.toString());
          },
        ),
      ),
    );
  }
}
