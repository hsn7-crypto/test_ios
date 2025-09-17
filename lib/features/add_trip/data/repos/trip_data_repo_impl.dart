import 'package:test_ios/core/errors/error.dart';
import 'package:test_ios/features/add_trip/data/data_source/trip_data_Local_data_source.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:test_ios/features/add_trip/domain/repos/trip_data_repo.dart';
import 'package:dartz/dartz.dart';

class TripDataRepoImpl extends TripDataRepo {
  final TripDataLocalDataSource tripDataLocalDataSource;

  TripDataRepoImpl(this.tripDataLocalDataSource);
  @override
  Either<Failure, bool> saveTripData({required TripDataEntity tripData}) {
    try {
      tripDataLocalDataSource.saveTripData(tripData: tripData);
      return right(true);
    } on Exception catch (e) {
      return left(LocalFailure(message: e.toString()));
    }
  }
}
