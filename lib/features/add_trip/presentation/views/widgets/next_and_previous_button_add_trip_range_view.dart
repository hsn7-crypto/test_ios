import 'package:test_ios/features/add_trip/presentation/views/widgets/custom_next_button_add_trip.dart';
import 'package:test_ios/features/add_trip/presentation/views/widgets/custom_previous_button_add_trip.dart';
import 'package:flutter/material.dart';

class NextAndPreviousButtonAddTripRangeView extends StatelessWidget {
  final void Function()? onPressedNext;
  final void Function()? onPressedPrevious;
  const NextAndPreviousButtonAddTripRangeView({
    super.key,
    this.onPressedNext,
    this.onPressedPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomNextButtonAddTrip(onPressed: onPressedNext),
        CustomPreviousButtonAddTrip(onPressed: onPressedPrevious),
      ],
    );
  }
}
