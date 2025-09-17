import 'package:test_ios/core/errors/error.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TripDataRepo {
  Either<Failure, bool> saveTripData({required TripDataEntity tripData});
}
