import 'package:test_ios/core/errors/error.dart';
import 'package:test_ios/core/use_case/use_case.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:test_ios/features/add_trip/domain/repos/trip_data_repo.dart';
import 'package:dartz/dartz.dart';

class SaveTripDataUseCase extends UseCase<bool, TripDataEntity> {
  final TripDataRepo tripDataRepo;

  SaveTripDataUseCase(this.tripDataRepo);
  @override
  Either<Failure, bool> call([TripDataEntity? param]) {
    return tripDataRepo.saveTripData(tripData: param!);
  }
}
