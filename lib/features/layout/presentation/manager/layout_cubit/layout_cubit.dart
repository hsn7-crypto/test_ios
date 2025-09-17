import 'package:test_ios/constants.dart';
import 'package:test_ios/core/utils/app_hive.dart';
import 'package:test_ios/core/utils/functions/is_the_data_correct.dart';
import 'package:test_ios/features/display_trip/presentation/views/display_trip_screen.dart';
import 'package:test_ios/features/home/presentation/views/home_view.dart';
import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:test_ios/features/sum_trip/presentation/views/sum_trip_view.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/utils/functions/show_snack_bar.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  late TextEditingController mainSalaryController;
  late TextEditingController numberOfHoursPerDayController;
  late TextEditingController childrenNumController;
  late TextEditingController personalLoanController;
  late TextEditingController personalLoanInstallmentController;

  String overnight = overnightList.first;
  String maritalStatus = genderList.first;

  bool isShowChildrenNum = false;

  int selectedIndex = 1;
  List<Widget> pages = const [SumTripView(), HomeView(), DisplayTripView()];

  @override
  Future<void> close() {
    mainSalaryController.dispose();
    numberOfHoursPerDayController.dispose();
    childrenNumController.dispose();
    personalLoanController.dispose();
    personalLoanInstallmentController.dispose();
    return super.close();
  }

  void getMainInformation() {
    Box<MainInformationEntity> mainInformationBox =
        Hive.box<MainInformationEntity>(AppHive.mainInformation);
    initController();
    if (mainInformationBox.isEmpty) {
      emit(LayoutMainInformationEmpty());
    }
  }

  void initController() {
    mainSalaryController = TextEditingController();
    numberOfHoursPerDayController = TextEditingController();
    childrenNumController = TextEditingController();
    personalLoanController = TextEditingController(text: '0');
    personalLoanInstallmentController = TextEditingController(text: '0');
  }

  void saveMainInformation(BuildContext context) {
    Either<String, bool> isCorrect = isTheDataCorrectMainInformation(
      mainSalary: mainSalaryController.text,
      numberOfHoursPerDay: numberOfHoursPerDayController.text,
      personalLoan: double.parse(personalLoanController.text),
      personalLoanInstallment: double.parse(
        personalLoanInstallmentController.text,
      ),
    );
    isCorrect.fold(
      (errorMesage) => showSnackBarInfo(
        context,
        message: errorMesage,
      ), //showToastInfo(msg: errorMesage),
      (corrected) {
        if (corrected) {
          MainInformationEntity mainInformationData = MainInformationEntity(
            double.parse(mainSalaryController.text),
            maritalStatus == genderList.first ||
                    childrenNumController.text.isEmpty
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
          emit(LayoutMainInformationSaved());
          //showToastSuccess(msg: 'تم حفظ البيانات بنجاح');
          showSnackBarSuccess(context, message: 'تم حفظ البيانات بنجاح');
        }
      },
    );
    /*
    Either<String, bool> isCorrect = isTheDataCorrect(mainInformation);

    isCorrect.fold(
      (errorMesage) => showSnackBarInfo(
        context,
        message: errorMesage,
      ), //showToastInfo(msg: errorMesage),
      (corrected) {
        if (corrected) {
          var box = Hive.box<MainInformationEntity>(AppHive.mainInformation);

          box.put(
            AppHive.mainInformation,
            mainInformation,
          );
          emit(LayoutMainInformationSaved());
          //showToastSuccess(msg: 'تم حفظ البيانات بنجاح');
          showSnackBarSuccess(context, message: 'تم حفظ البيانات بنجاح');
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

  void canShowChildrenNum({required String maritalStatus}) {
    isShowChildrenNum = maritalStatus == genderList.last;
    emit(LayoutMainInformationIsShowChildrenNum());
  }

  void changeIndex(int index) {
    if (index != selectedIndex) {
      selectedIndex = index;
      emit(LayoutChangeIndex());
    }
  }
}
