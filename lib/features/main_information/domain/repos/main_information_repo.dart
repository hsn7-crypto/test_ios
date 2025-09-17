import 'package:test_ios/core/errors/error.dart';
import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MainInformationRepo {
  Either<Failure, MainInformationEntity> fetchMainInformationData();
  Either<Failure, bool> saveMainInformationData({
    required MainInformationEntity mainInformation,
  });
}
