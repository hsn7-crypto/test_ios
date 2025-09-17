import 'package:test_ios/core/utils/app_hive.dart';
import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:hive/hive.dart';

abstract class MainInformationLocalDataSource {
  MainInformationEntity fetchMainInformationData();
  void saveMainInformationData({
    required MainInformationEntity mainInformation,
  });
}

class MainInformationLocalDataSourceImpl
    extends MainInformationLocalDataSource {
  @override
  MainInformationEntity fetchMainInformationData() {
    Box<MainInformationEntity> box = Hive.box<MainInformationEntity>(
      AppHive.mainInformation,
    );

    return box.values.first;
  }

  @override
  void saveMainInformationData({
    required MainInformationEntity mainInformation,
  }) {
    var box = Hive.box<MainInformationEntity>(AppHive.mainInformation);

    box.put(AppHive.mainInformation, mainInformation);
  }
}
