import 'package:test_ios/core/utils/app_hive.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class TripDataLocalDataSource {
  void saveTripData({required TripDataEntity tripData});
}

class TripDataLocalDataSourceImpl extends TripDataLocalDataSource {
  @override
  void saveTripData({required TripDataEntity tripData}) {
    var box = Hive.box<TripDataEntity>(AppHive.tripData);

    box.add(tripData);
  }
}
