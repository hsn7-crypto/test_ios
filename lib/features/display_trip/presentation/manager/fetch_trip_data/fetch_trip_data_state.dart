part of 'fetch_trip_data_cubit.dart';

@immutable
sealed class FetchTripDataState {}

final class FetchTripDataInitial extends FetchTripDataState {}

final class FetchTripDataLoaded extends FetchTripDataState {
  final List<TripDataEntity> tripDataEntity;

  FetchTripDataLoaded({required this.tripDataEntity});
}

final class FetchTripDataEmptyData extends FetchTripDataState {}

final class FetchTripDataFailure extends FetchTripDataState {
  final String message;

  FetchTripDataFailure({required this.message});
}
