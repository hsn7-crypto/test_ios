import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/features/display_trip/presentation/manager/update_trip/update_trip_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EditStartAndEndDateTrip extends StatelessWidget {
  //final String month;
  const EditStartAndEndDateTrip({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateTripCubit cubit = context.read<UpdateTripCubit>();
    return SfDateRangePicker(
      controller: cubit.dateRangePickerController,
      view: DateRangePickerView.month,
      allowViewNavigation: false,
      showNavigationArrow: false,
      selectionMode: DateRangePickerSelectionMode.multiRange,
      monthViewSettings: const DateRangePickerMonthViewSettings(
        showTrailingAndLeadingDates: false,
      ),
      minDate: cubit.getMinDate(),
      maxDate: cubit.getMaxDate(),
      initialDisplayDate: cubit.startTripDate,
      initialSelectedRanges: cubit.initialSelectedRanges(),
      todayHighlightColor: AppColors.mainColor,
      headerStyle: const DateRangePickerHeaderStyle(
        textAlign: TextAlign.center,
      ),
      rangeSelectionColor: AppColors.mainColor.withOpacity(0.3),
      startRangeSelectionColor: AppColors.mainColor,
      endRangeSelectionColor: AppColors.mainColor,
      monthCellStyle: const DateRangePickerMonthCellStyle(
        todayTextStyle: TextStyle(color: AppColors.mainColor),
      ),
    );
  }
}
