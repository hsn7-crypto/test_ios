import 'package:test_ios/core/errors/error.dart';
import 'package:test_ios/core/use_case/use_case.dart';
import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:test_ios/features/main_information/domain/repos/main_information_repo.dart';
import 'package:dartz/dartz.dart';

class SaveMainInformationDataUseCase
    extends UseCase<bool, MainInformationEntity> {
  final MainInformationRepo mainInformationRepo;

  SaveMainInformationDataUseCase(this.mainInformationRepo);

  @override
  Either<Failure, bool> call([MainInformationEntity? param]) {
    return mainInformationRepo.saveMainInformationData(mainInformation: param!);
  }
}
