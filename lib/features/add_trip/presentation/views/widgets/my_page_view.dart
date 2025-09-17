import 'package:test_ios/features/add_trip/presentation/views/add_holiday_in_trip_body.dart';
import 'package:test_ios/features/add_trip/presentation/views/add_trip_range_view.dart';
import 'package:test_ios/features/add_trip/presentation/views/discounts_and_bonuses.dart';
import 'package:flutter/material.dart';

class MyPageView extends StatelessWidget {
  final Function(int)? onPageChanged;
  final PageController? controller;
  const MyPageView({super.key, this.onPageChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: onPageChanged,
        children: const [
          Center(child: AddTripRangeView()),
          Center(child: AddHolidayInTrip()),
          Center(child: DiscountsAndBonusesScreen()),
        ],
      ),
    );
  }
}
