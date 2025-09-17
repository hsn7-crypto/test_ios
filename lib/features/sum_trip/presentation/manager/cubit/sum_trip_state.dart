part of 'sum_trip_cubit.dart';

@immutable
sealed class SumTripState {}

final class SumTripInitial extends SumTripState {}

final class SumTripCanShowChildrenNum extends SumTripState {}
