import 'package:test_ios/core/utils/app_hive.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class FetchTripDataLocalDataSource {
  List<TripDataEntity> fetchTripData();
}

class FetchTripDataLocalDataSourceImpl extends FetchTripDataLocalDataSource {
  @override
  List<TripDataEntity> fetchTripData() {
    Box<TripDataEntity> box = Hive.box<TripDataEntity>(AppHive.tripData);

    return box.values.toList();
  }
}
