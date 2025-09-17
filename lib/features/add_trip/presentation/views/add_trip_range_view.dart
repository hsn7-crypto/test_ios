import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/features/add_trip/presentation/manager/trip_data/trip_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddTripRangeView extends StatelessWidget {
  const AddTripRangeView({super.key});

  @override
  Widget build(BuildContext context) {
    TripDataCubit cubit = context.read<TripDataCubit>();

    return SfDateRangePicker(
      controller: cubit.dateRangePickerController,
      minDate: cubit.getMinAndDate(),
      view: DateRangePickerView.month,
      todayHighlightColor: AppColors.mainColor,
      rangeSelectionColor: AppColors.mainColor.withOpacity(0.17),
      startRangeSelectionColor: AppColors.mainColor,
      endRangeSelectionColor: AppColors.mainColor,
      selectionMode: DateRangePickerSelectionMode.extendableRange,
      navigationMode: DateRangePickerNavigationMode.snap,
      headerStyle: const DateRangePickerHeaderStyle(
        textAlign: TextAlign.center,
      ),
      rangeTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.mainColor,
      ),
    );
  }
}
