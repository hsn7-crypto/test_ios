import 'package:test_ios/constants.dart';
import 'package:test_ios/core/utils/app_router.dart';
import 'package:test_ios/core/utils/functions/is_the_data_correct.dart';
import 'package:test_ios/core/utils/functions/sum_salary/main_function.dart';
import 'package:test_ios/features/sum_trip/data/models/result_sum_trip_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_ios/core/utils/functions/show_snack_bar.dart';

part 'sum_trip_state.dart';

class SumTripCubit extends Cubit<SumTripState> {
  SumTripCubit() : super(SumTripInitial());
  ////////////////////////////
  TextEditingController mainSalaryController = TextEditingController();
  TextEditingController numberOfHoursPerDayController = TextEditingController();
  TextEditingController childrenNumController = TextEditingController(
    text: '0',
  );
  TextEditingController personalLoanInstallmentController =
      TextEditingController(text: '0');
  TextEditingController dayCountController = TextEditingController();
  TextEditingController holidayCountController = TextEditingController(
    text: '0',
  );
  TextEditingController satAndfridayCountController = TextEditingController();
  TextEditingController bonusesController = TextEditingController(text: '0');

  String overnight = overnightList.first;
  String maritalStatus = genderList.first;
  ///////////////////////////
  bool isShowChildrenNum = false;
  /*
  double mainSalary = 0;
  int dayCount = 0;
  int holidayCount = 0;
  int satAndfridayCount = 0;
  String overnightValue = overnightList.first;
  double numberOfHoursPerDay = 0;
  double personalLoanInstallment = 0;
  String maritalStatus = genderList.first;
  int childrenNum = 0;
  double bonuses = 0;
  */

  void sumTrip(BuildContext context) {
    /*
    ResultSumTripModel result = SumSalary(
      dayCount: dayCount,
      holidayCount: holidayCount + satAndfridayCount,
    ).getResultFromSumSalary(
      mainSalary: mainSalary,
      dayCount: dayCount,
      holidayCount: holidayCount,
      satAndfridayCount: satAndfridayCount,
      overnightValue: overnightValue,
      numberOfHoursPerDay: numberOfHoursPerDay,
      personalLoanInstallment: personalLoanInstallment,
      maritalStatus: maritalStatus,
      childrenNum: childrenNum,
      bonuses: bonuses,
    );
    */
    Either<String, bool> isCorrect = isTheDataCorrectSumTrip(
      mainSalary: mainSalaryController.text,
      numberOfHoursPerDay: numberOfHoursPerDayController.text,
      dayCount: dayCountController.text,
      satAndfridayCount: satAndfridayCountController.text,
    );
    isCorrect.fold((message) => showSnackBarInfo(context, message: message), (
      _,
    ) {
      double mainSalary = double.parse(mainSalaryController.text);
      double numberOfHoursPerDay = double.parse(
        numberOfHoursPerDayController.text,
      );
      int dayCount = int.parse(dayCountController.text);
      int satAndfridayCount = int.parse(satAndfridayCountController.text);
      int holidayCount = holidayCountController.text.isEmpty
          ? 0
          : int.parse(holidayCountController.text);

      double personalLoanInstallment =
          personalLoanInstallmentController.text.isEmpty
          ? 0
          : double.parse(personalLoanInstallmentController.text);
      int childrenNum = childrenNumController.text.isEmpty
          ? 0
          : int.parse(childrenNumController.text);
      double bonuses = bonusesController.text.isEmpty
          ? 0
          : double.parse(bonusesController.text);
      ResultSumTripModel result =
          SumSalary(
            dayCount: dayCount,
            holidayCount: holidayCount + satAndfridayCount,
          ).getResultFromSumSalary(
            mainSalary: mainSalary,
            dayCount: dayCount,
            holidayCount: holidayCount,
            satAndfridayCount: satAndfridayCount,
            overnightValue: overnight,
            numberOfHoursPerDay: numberOfHoursPerDay,
            personalLoanInstallment: personalLoanInstallment,
            maritalStatus: maritalStatus,
            childrenNum: childrenNum,
            bonuses: bonuses,
          );
      GoRouter.of(context).push(AppRouter.resultSumTripView, extra: result);
    });
  }

  /*
  void setMainSalary(String mainSalary) {
    if (mainSalary.isEmpty) {
      return;
    }
    this.mainSalary = double.parse(mainSalary);
  }

  void setDayCount(String dayCount) {
    if (dayCount.isEmpty) {
      return;
    }
    this.dayCount = int.parse(dayCount);
  }

  void setHolidayCount(String holidayCount) {
    if (holidayCount.isEmpty) {
      return;
    }
    this.holidayCount = int.parse(holidayCount);
  }

  void setSatAndfridayCount(String satAndfridayCount) {
    if (satAndfridayCount.isEmpty) {
      return;
    }
    this.satAndfridayCount = int.parse(satAndfridayCount);
  }

  void setOvernightValue(String overnightValue) {
    this.overnightValue = overnightValue;
  }

  void setNumberOfHoursPerDay(String numberOfHoursPerDay) {
    if (numberOfHoursPerDay.isEmpty) {
      return;
    }
    this.numberOfHoursPerDay = double.parse(numberOfHoursPerDay);
  }

  void setPersonalLoanInstallment(String personalLoanInstallment) {
    if (personalLoanInstallment.isEmpty) {
      return;
    }
    this.personalLoanInstallment = double.parse(personalLoanInstallment);
  }

  void setMaritalStatus(String maritalStatus) {
    this.maritalStatus = maritalStatus;

    isShowChildrenNum = this.maritalStatus == genderList.last;
    emit(SumTripCanShowChildrenNum());
  }

  void setChildrenNum(String childrenNum) {
    if (childrenNum.isEmpty) {
      return;
    }
    this.childrenNum = int.parse(childrenNum);
  }

  void setBonuses(String bonuses) {
    if (bonuses.isEmpty) {
      return;
    }
    this.bonuses = double.parse(bonuses);
  }
  */
  void canShowChildrenNum({required String maritalStatus}) {
    isShowChildrenNum = maritalStatus == genderList.last;
    emit(SumTripCanShowChildrenNum());
  }
}
