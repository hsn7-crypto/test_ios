import 'package:test_ios/core/errors/error.dart';
import 'package:test_ios/core/use_case/use_case.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:test_ios/features/display_trip/domain/repos/fetch_trip_data_repo.dart';
import 'package:dartz/dartz.dart';

class FetchTripDataUseCase extends UseCase<List<TripDataEntity>, NoParam> {
  final FetchTripDataRepo fetchTripDataRepo;

  FetchTripDataUseCase(this.fetchTripDataRepo);

  @override
  Either<Failure, List<TripDataEntity>> call([NoParam? param]) {
    return fetchTripDataRepo.fetchTripData();
  }
}
