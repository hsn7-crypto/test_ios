import 'package:test_ios/constants.dart';
import 'package:test_ios/core/utils/app_hive.dart';
import 'package:test_ios/core/utils/functions/is_the_data_correct.dart';
import 'package:test_ios/core/utils/functions/show_snack_bar.dart';
import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:test_ios/features/main_information/domain/use_cases/fetch_main_information_data_use_case.dart';
import 'package:test_ios/features/main_information/domain/use_cases/save_main_information_data_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:test_ios/core/errors/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'main_information_state.dart';

class MainInformationCubit extends Cubit<MainInformationState> {
  MainInformationCubit(
    this.mainInformationDataUseCase,
    this.saveMainInformationDataUseCase,
  ) : super(MainInformationInitial());

  final FetchMainInformationDataUseCase mainInformationDataUseCase;

  late TextEditingController mainSalaryController;
  late TextEditingController numberOfHoursPerDayController;
  late TextEditingController childrenNumController;
  late TextEditingController personalLoanController;
  late TextEditingController personalLoanInstallmentController;

  String overnight = overnightList.first;
  String maritalStatus = genderList.first;

  bool isShowChildrenNum = false;
  void initDisplayData({
    required double mainSalary,
    required double numberOfHoursPerDay,
    required int childrenNum,
    required double personalLoan,
    required double personalLoanInstallment,
  }) {
    mainSalaryController = TextEditingController(text: mainSalary.toString());
    numberOfHoursPerDayController = TextEditingController(
      text: numberOfHoursPerDay.toString(),
    );
    childrenNumController = TextEditingController(text: childrenNum.toString());
    personalLoanController = TextEditingController(
      text: personalLoan.toString(),
    );
    personalLoanInstallmentController = TextEditingController(
      text: personalLoanInstallment.toString(),
    );
  }

  void fetchMainInformationData() {
    Either<Failure, MainInformationEntity> result = mainInformationDataUseCase
        .call();

    result.fold(
      (Failure failure) {
        emit(
          MainInformationEmpty(
            message: 'Empty',
            mainInformationEntity: MainInformationEntity.empty(),
          ),
        );
      },
      (MainInformationEntity mainInformation) {
        initDisplayData(
          childrenNum: mainInformation.childrenNum,
          mainSalary: mainInformation.mainSalary,
          numberOfHoursPerDay: mainInformation.numberOfHoursPerDay,
          personalLoan: mainInformation.personalLoan,
          personalLoanInstallment: mainInformation.personalLoanInstallment,
        );
        emit(MainInformationSuccess(mainInformationEntity: mainInformation));
      },
    );
  }

  void canShowChildrenNum({required String maritalStatus}) {
    isShowChildrenNum = maritalStatus == genderList.last;
    fetchMainInformationData();
  }

  //////////////////////////// Save Main Information //////////////////////////////////
  final SaveMainInformationDataUseCase saveMainInformationDataUseCase;

  void saveMainInformationData({required BuildContext context}) {
    Either<String, bool> isCorrect = isTheDataCorrectMainInformation(
      mainSalary: mainSalaryController.text,
      numberOfHoursPerDay: numberOfHoursPerDayController.text,
      personalLoan: double.parse(personalLoanController.text),
      personalLoanInstallment: double.parse(
        personalLoanInstallmentController.text,
      ),
    );
    isCorrect.fold(
      (errorMesage) => showSnackBarInfo(context, message: errorMesage),
      (corrected) {
        if (corrected) {
          MainInformationEntity mainInformationData = MainInformationEntity(
            double.parse(mainSalaryController.text),
            maritalStatus == genderList.first
                ? 0
                : int.parse(childrenNumController.text),
            double.parse(numberOfHoursPerDayController.text),
            personalLoanController.text.isEmpty
                ? 0
                : double.parse(personalLoanController.text),
            personalLoanInstallmentController.text.isEmpty
                ? 0
                : double.parse(personalLoanInstallmentController.text),
            overnight,
            maritalStatus,
          );
          saveDataHive(mainInformation: mainInformationData);
          emit(
            MainInformationSuccess(mainInformationEntity: mainInformationData),
          );

          showSnackBarSuccess(context, message: 'تم حفظ البيانات بنجاح');
        }
      },
    );
  }

  void saveDataHive({required MainInformationEntity mainInformation}) {
    Box<MainInformationEntity> box = Hive.box<MainInformationEntity>(
      AppHive.mainInformation,
    );

    box.put(AppHive.mainInformation, mainInformation);
  }
}
