part of 'trip_data_cubit.dart';

@immutable
sealed class TripDataState {}

final class TripDataInitial extends TripDataState {}

final class TripDataLoaded extends TripDataState {}

final class TripDataFailure extends TripDataState {
  final String message;

  TripDataFailure({required this.message});
}

final class TripDataSetStartAndEndDate extends TripDataState {}

final class TripDataDeleteHolidayInTrip extends TripDataState {}

final class TripDataAddHolidayInTrip extends TripDataState {}
