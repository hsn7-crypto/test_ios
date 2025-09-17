part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}

final class LayoutChangeIndex extends LayoutState {}

final class LayoutMainInformationEmpty extends LayoutState {}

final class LayoutMainInformationSaved extends LayoutState {}

final class LayoutMainInformationIsShowChildrenNum extends LayoutState {}
