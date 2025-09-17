part of '../save_main_information/save_main_information_cubit.dart';

@immutable
sealed class SaveMainInformationState {}

final class SaveMainInformationInitial extends SaveMainInformationState {}

final class SaveMainInformationSuccess extends SaveMainInformationState {}

final class SaveMainInformationEmpty extends SaveMainInformationState {
  final String message;

  SaveMainInformationEmpty({required this.message});
}
