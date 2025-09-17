part of 'update_trip_cubit.dart';

@immutable
sealed class UpdateTripState {}

final class UpdateTripInitial extends UpdateTripState {}

final class UpdateTripAdded extends UpdateTripState {}

final class UpdateTripAddHolidayInTrip extends UpdateTripState {}

final class UpdateTripDeleteHolidayInTrip extends UpdateTripState {}

final class UpdateTripInitialStartAndEndTrip extends UpdateTripState {}

final class UpdateTripCanShowChildrenNum extends UpdateTripState {}

final class UpdateTripChangePage extends UpdateTripState {}
