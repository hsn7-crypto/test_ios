import 'package:test_ios/core/errors/error.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:test_ios/features/display_trip/data/data_source/fetch_trip_data_Local_data_source.dart';
import 'package:test_ios/features/display_trip/domain/repos/fetch_trip_data_repo.dart';
import 'package:dartz/dartz.dart';

class FetchTripDataRepoImpl extends FetchTripDataRepo {
  final FetchTripDataLocalDataSource fetchTripDataLocalDataSource;

  FetchTripDataRepoImpl(this.fetchTripDataLocalDataSource);
  @override
  Either<Failure, List<TripDataEntity>> fetchTripData() {
    try {
      List<TripDataEntity> trips = fetchTripDataLocalDataSource.fetchTripData();
      return right(trips);
    } on Exception catch (e) {
      return left(LocalFailure(message: e.toString()));
    }
  }
}
