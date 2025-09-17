part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeEmptyData extends HomeState {}

final class HomeRefreshData extends HomeState {}
