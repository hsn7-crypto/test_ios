import 'package:test_ios/core/errors/error.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:test_ios/features/display_trip/domain/use_cases/fetch_trip_data_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'fetch_trip_data_state.dart';

class FetchTripDataCubit extends Cubit<FetchTripDataState> {
  final FetchTripDataUseCase fetchTripDataUseCase;
  FetchTripDataCubit({required this.fetchTripDataUseCase})
    : super(FetchTripDataInitial());
  DateRangePickerController rangePickerController = DateRangePickerController();

  @override
  Future<void> close() {
    rangePickerController.dispose();
    return super.close();
  }

  void fetchTripData() {
    Either<Failure, List<TripDataEntity>> result = fetchTripDataUseCase.call();

    result.fold(
      (failure) => emit(FetchTripDataFailure(message: failure.message)),
      (trips) {
        if (trips.isEmpty) {
          return emit(FetchTripDataEmptyData());
        }
        trips.sort((a, b) => b.startTripDate!.compareTo(a.startTripDate!));

        return emit(FetchTripDataLoaded(tripDataEntity: trips));
      },
    );
  }

  String returnMonth(DateTime date) {
    return DateFormat.MMM().format(date);
  }
}
