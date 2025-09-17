import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:test_ios/features/display_trip/presentation/views/widgets/data_trip_month_view.dart';
import 'package:flutter/material.dart';

class DataTripMonthListView extends StatelessWidget {
  final List<TripDataEntity> trips;
  const DataTripMonthListView({super.key, required this.trips});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: trips.length,
      itemBuilder: (context, index) {
        return DataTripMonthView(tripData: trips[index], index: index);
      },
    );
  }
}
