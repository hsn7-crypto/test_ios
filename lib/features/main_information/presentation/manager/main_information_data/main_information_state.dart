part of 'main_information_cubit.dart';

@immutable
sealed class MainInformationState {}

final class MainInformationInitial extends MainInformationState {}

final class MainInformationLoading extends MainInformationState {}

final class MainInformationSuccess extends MainInformationState {
  final MainInformationEntity mainInformationEntity;

  MainInformationSuccess({required this.mainInformationEntity});
}

final class MainInformationEmpty extends MainInformationState {
  final String message;
  final MainInformationEntity mainInformationEntity;

  MainInformationEmpty({
    required this.message,
    required this.mainInformationEntity,
  });
}

final class MainInformationIsShowChildrenNum extends MainInformationState {}

/*
final class MainInformationSuccess extends MainInformationState {
  final MainInformationEntity mainInformationEntity;

  MainInformationSuccess({required this.mainInformationEntity});
}
*/
