import 'package:test_ios/constants.dart';
import 'package:test_ios/core/utils/app_hive.dart';
import 'package:test_ios/core/utils/functions/is_the_data_correct.dart';
import 'package:test_ios/core/utils/functions/show_snack_bar.dart';
import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:test_ios/features/main_information/domain/use_cases/save_main_information_data_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'save_main_information_state.dart';

class SaveMainInformationCubit extends Cubit<SaveMainInformationState> {
  SaveMainInformationCubit(this.saveMainInformationDataUseCase)
    : super(SaveMainInformationInitial());

  final SaveMainInformationDataUseCase saveMainInformationDataUseCase;

  void saveMainInformationData({
    required MainInformationEntity mainInformation,
    required BuildContext context,
  }) {
    //Either<String, bool> isCorrect = isTheDataCorrect(mainInformation);
    Either<String, bool> isCorrect = isTheDataCorrectMainInformation(
      mainSalary: mainInformation.mainSalary.toString(),
      numberOfHoursPerDay: mainInformation.numberOfHoursPerDay.toString(),
      personalLoan: mainInformation.personalLoan,
      personalLoanInstallment: mainInformation.personalLoanInstallment,
    );
    isCorrect.fold(
      (errorMesage) => showSnackBarInfo(context, message: errorMesage),
      (corrected) {
        if (corrected) {
          MainInformationEntity mainInformationData = MainInformationEntity(
            mainInformation.mainSalary,
            mainInformation.maritalStatus == genderList.first
                ? 0
                : mainInformation.childrenNum,
            mainInformation.numberOfHoursPerDay,
            mainInformation.personalLoan.toString().isEmpty
                ? 0
                : mainInformation.personalLoan,
            mainInformation.personalLoanInstallment.toString().isEmpty
                ? 0
                : mainInformation.personalLoanInstallment,
            mainInformation.overnight,
            mainInformation.maritalStatus,
          );
          saveDataHive(mainInformation: mainInformationData);
          emit(SaveMainInformationSuccess());
          showSnackBarSuccess(context, message: 'تم حفظ البيانات بنجاح');
        }
      },
    );
    /*
    isCorrect.fold(
      (errorMesage) => showSnackBarInfo(context, message: errorMesage),
      (corrected) {
        if (corrected) {
          var box = Hive.box<MainInformationEntity>(AppHive.mainInformation);

          box.put(
            AppHive.mainInformation,
            mainInformation,
          );
          emit(SaveMainInformationSuccess());
          showSnackBarSuccess(context, message: 'تم حقظ البيانات بنجاح');
        }
      },
    );
    */
  }

  void saveDataHive({required MainInformationEntity mainInformation}) {
    Box<MainInformationEntity> box = Hive.box<MainInformationEntity>(
      AppHive.mainInformation,
    );

    box.put(AppHive.mainInformation, mainInformation);
  }
}
