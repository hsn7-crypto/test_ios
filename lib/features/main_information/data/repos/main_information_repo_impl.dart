import 'package:test_ios/core/errors/error.dart';
import 'package:test_ios/features/main_information/data/data_sources/main_information_local_data_source.dart';
import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:test_ios/features/main_information/domain/repos/main_information_repo.dart';
import 'package:dartz/dartz.dart';

class MainInformationRepoImpl extends MainInformationRepo {
  final MainInformationLocalDataSource mainInformationLocalDataSource;

  MainInformationRepoImpl({required this.mainInformationLocalDataSource});
  @override
  Either<Failure, MainInformationEntity> fetchMainInformationData() {
    try {
      MainInformationEntity mainInformation = mainInformationLocalDataSource
          .fetchMainInformationData();

      return right(mainInformation);
    } catch (e) {
      if (e.toString() == 'Bad state: No element') {
        return left(EmptyFailure(message: 'Empty'));
      }

      return left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Either<Failure, bool> saveMainInformationData({
    required MainInformationEntity mainInformation,
  }) {
    try {
      mainInformationLocalDataSource.saveMainInformationData(
        mainInformation: mainInformation,
      );

      return right(true);
    } catch (e) {
      if (e.toString() == 'Bad state: No element') {
        return left(EmptyFailure(message: 'Empty'));
      }

      return left(LocalFailure(message: e.toString()));
    }
  }
}
