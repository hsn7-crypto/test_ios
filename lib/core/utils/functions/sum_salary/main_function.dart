import 'package:test_ios/core/utils/app_hive.dart';
import 'package:test_ios/features/add_trip/data/models/trip_data.model.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:test_ios/features/sum_trip/data/models/result_sum_trip_model.dart';
import 'package:hive/hive.dart';

class SumSalary {
  final int dayCount;
  final int holidayCount;
  /////////////////////////////////////////////////
  int fieldAllowance = 0;
  double fridayAndSaturdayAndHolidayValue = 0.0;
  double extraWork = 0.0;
  double totalSalary = 0.0;
  double netSalary = 0.0;
  double solidarityTax = 0.0;
  double guaranteeTax = 0.0;
  double jihadTax = 0.0;
  double incomeTax = 0.0;
  double hourlyValue = 0.0;

  double personalLoanValue = 0.0;
  double personalLoanInstallmentValue = 0.0;

  SumSalary({required this.dayCount, required this.holidayCount});

  TripDataModel? getResultFromUpdateSalary({
    required MainInformationEntity mainInformation,
    required DateTime startTripDate,
    required DateTime endTripDate,
    required List<DateTime> jobdays,
    required List<DateTime> holidays,
    required List<DateTime> fridayAndSaturdayHoliday,
    required double bonuses,
    required double discounts,
  }) {
    TripDataModel? tripData;

    _fieldAllowanceFunction(
      overnightValue: mainInformation.overnight,
      dayCount: dayCount,
    );
    _friAndSatAndHoliday(
      dayCount: dayCount,
      holidayCount: holidayCount,
      mainSalary: mainInformation.mainSalary,
      numberOfHoursPerDay: mainInformation.numberOfHoursPerDay,
      overnight: mainInformation.overnight,
    );
    _sumTotalSalary(
      extraWork: extraWork,
      fieldAllowance: fieldAllowance,
      fridayAndSaturdayAndHoliday: fridayAndSaturdayAndHolidayValue,
      mainSalary: mainInformation.mainSalary,
    );
    _solidarityTaxAndGuaranteeTax(
      bonuses: bonuses,
      childrenNum: mainInformation.childrenNum,
      maritalStatus: mainInformation.maritalStatus,
      totalSalary: totalSalary,
    );

    tripData = TripDataModel(
      startTripDate: startTripDate,
      endTripDate: endTripDate,
      mainInformation: mainInformation,
      jobdays: jobdays,
      holidays: holidays,
      totalSalary: totalSalary,
      netSalary: netSalary,
      fieldAllowance: fieldAllowance,
      extraWork: extraWork,
      fridayAndSaturdayAndHolidayValue: fridayAndSaturdayAndHolidayValue,
      fridayAndSaturdayHoliday: fridayAndSaturdayHoliday,
      solidarityTax: solidarityTax,
      guaranteeTax: guaranteeTax,
      jihadTax: jihadTax,
      incomeTax: incomeTax,
      bonuses: bonuses,
      discounts: discounts,
      hourlyValue: hourlyValue,
    );

    double hourlyValueResult = mainInformation.mainSalary / 162.5013762;

    _solidarityTaxAndGuaranteeTax(
      bonuses: bonuses,
      childrenNum: mainInformation.childrenNum,
      maritalStatus: mainInformation.maritalStatus,
      totalSalary: mainInformation.mainSalary,
    );

    _monthlyInstallmentDiscount(
      personalLoan: mainInformation.personalLoan,
      personalLoanInstallment: mainInformation.personalLoanInstallment,
    );

    tripData.addMonthSalary(
      totalSalary: mainInformation.mainSalary,
      netSalary: netSalary,
      solidarityTax: solidarityTax,
      guaranteeTax: guaranteeTax,
      jihadTax: jihadTax,
      incomeTax: incomeTax,
      hourlyValue: hourlyValueResult,
    );

    return tripData;
  }

  ResultSumTripModel getResultFromSumSalary({
    required double mainSalary,
    required int dayCount,
    required int holidayCount,
    required int satAndfridayCount,
    required String overnightValue,
    required double numberOfHoursPerDay,
    required double personalLoanInstallment,
    required String maritalStatus,
    required int childrenNum,
    required double bonuses,
  }) {
    ResultSumTripModel resultSumTripData;

    _fieldAllowanceFunction(overnightValue: overnightValue, dayCount: dayCount);
    _friAndSatAndHoliday(
      dayCount: dayCount,
      holidayCount: holidayCount + satAndfridayCount,
      mainSalary: mainSalary,
      numberOfHoursPerDay: numberOfHoursPerDay,
      overnight: overnightValue,
    );
    _sumTotalSalary(
      extraWork: extraWork,
      fieldAllowance: fieldAllowance,
      fridayAndSaturdayAndHoliday: fridayAndSaturdayAndHolidayValue,
      mainSalary: mainSalary,
    );
    _solidarityTaxAndGuaranteeTax(
      bonuses: bonuses,
      childrenNum: childrenNum,
      maritalStatus: maritalStatus,
      totalSalary: totalSalary,
    );

    resultSumTripData = ResultSumTripModel(
      dayCount: dayCount,
      holidayCount: holidayCount,
      bonuses: bonuses,
      fieldAllowance: fieldAllowance,
      fridayAndSaturdayAndHoliday: fridayAndSaturdayAndHolidayValue,
      extraWork: extraWork,
      totalSalary: totalSalary,
      netSalary: netSalary,
      solidarityTax: solidarityTax,
      guaranteeTax: guaranteeTax,
      jihadTax: jihadTax,
      incomeTax: incomeTax,
      hourlyValue: hourlyValue,
    );

    return resultSumTripData;
  }

  TripDataModel? getResult({
    required DateTime startTripDate,
    required DateTime endTripDate,
    required List<DateTime> jobdays,
    required List<DateTime> holidays,
    required List<DateTime> fridayAndSaturdayHoliday,
    required double bonuses,
    required double discounts,
  }) {
    Box<MainInformationEntity> box = Hive.box<MainInformationEntity>(
      AppHive.mainInformation,
    );

    TripDataModel? tripData;
    if (box.isNotEmpty) {
      MainInformationEntity mainInformation = box.values.first.clone();

      _fieldAllowanceFunction(
        overnightValue: mainInformation.overnight,
        dayCount: dayCount,
      );
      _friAndSatAndHoliday(
        dayCount: dayCount,
        holidayCount: holidayCount,
        mainSalary: mainInformation.mainSalary,
        numberOfHoursPerDay: mainInformation.numberOfHoursPerDay,
        overnight: mainInformation.overnight,
      );
      _sumTotalSalary(
        extraWork: extraWork,
        fieldAllowance: fieldAllowance,
        fridayAndSaturdayAndHoliday: fridayAndSaturdayAndHolidayValue,
        mainSalary: mainInformation.mainSalary,
      );
      _solidarityTaxAndGuaranteeTax(
        bonuses: bonuses,
        childrenNum: mainInformation.childrenNum,
        maritalStatus: mainInformation.maritalStatus,
        totalSalary: totalSalary,
      );

      tripData = TripDataModel(
        startTripDate: startTripDate,
        endTripDate: endTripDate,
        mainInformation: mainInformation,
        jobdays: jobdays,
        holidays: holidays,
        totalSalary: totalSalary,
        netSalary: netSalary,
        fieldAllowance: fieldAllowance,
        extraWork: extraWork,
        fridayAndSaturdayAndHolidayValue: fridayAndSaturdayAndHolidayValue,
        fridayAndSaturdayHoliday: fridayAndSaturdayHoliday,
        solidarityTax: solidarityTax,
        guaranteeTax: guaranteeTax,
        jihadTax: jihadTax,
        incomeTax: incomeTax,
        bonuses: bonuses,
        discounts: discounts,
        hourlyValue: hourlyValue,
      );
      //////////////////////////////////////////////////////////////

      double hourlyValueResult = mainInformation.mainSalary / 162.5013762;

      _solidarityTaxAndGuaranteeTax(
        bonuses: 0,
        childrenNum: mainInformation.childrenNum,
        maritalStatus: mainInformation.maritalStatus,
        totalSalary: mainInformation.mainSalary,
      );

      _monthlyInstallmentDiscount(
        personalLoan: mainInformation.personalLoan,
        personalLoanInstallment: mainInformation.personalLoanInstallment,
      );

      tripData.addMonthSalary(
        totalSalary: mainInformation.mainSalary - personalLoanInstallmentValue,
        netSalary: netSalary,
        solidarityTax: solidarityTax,
        guaranteeTax: guaranteeTax,
        jihadTax: jihadTax,
        incomeTax: incomeTax,
        hourlyValue: hourlyValueResult,
      );
    }

    return tripData;
  }

  TripDataModel? getResultOffMonth({
    required DateTime startTripDate,
    required DateTime endTripDate,
  }) {
    Box<MainInformationEntity> box = Hive.box<MainInformationEntity>(
      AppHive.mainInformation,
    );

    TripDataModel? tripData;
    if (box.isNotEmpty) {
      MainInformationEntity mainInformation = box.values.first.clone();

      //////////////////////////////////////////////////////////////

      double hourlyValueResult = mainInformation.mainSalary / 162.5013762;

      _solidarityTaxAndGuaranteeTax(
        bonuses: 0,
        childrenNum: mainInformation.childrenNum,
        maritalStatus: mainInformation.maritalStatus,
        totalSalary: mainInformation.mainSalary,
      );

      _monthlyInstallmentDiscount(
        personalLoan: mainInformation.personalLoan,
        personalLoanInstallment: mainInformation.personalLoanInstallment,
      );

      tripData = TripDataModel(
        startTripDate: startTripDate,
        endTripDate: endTripDate,
        mainInformation: mainInformation,
        jobdays: [],
        holidays: [],
        totalSalary: mainInformation.mainSalary,
        netSalary: netSalary,
        fieldAllowance: fieldAllowance,
        extraWork: extraWork,
        fridayAndSaturdayAndHolidayValue: fridayAndSaturdayAndHolidayValue,
        fridayAndSaturdayHoliday: [],
        solidarityTax: solidarityTax,
        guaranteeTax: guaranteeTax,
        jihadTax: jihadTax,
        incomeTax: incomeTax,
        bonuses: 0,
        discounts: 0,
        hourlyValue: hourlyValueResult,
      );
    }

    return tripData;
  }

  void _fieldAllowanceFunction({
    required String overnightValue,
    required int dayCount,
  }) {
    int overnight = int.parse(overnightValue);
    int result = dayCount * overnight;
    fieldAllowance = result;
  }

  void _friAndSatAndHoliday({
    required double mainSalary,
    required String overnight,
    required double numberOfHoursPerDay,
    required int dayCount,
    required int holidayCount,
  }) {
    int overnightValue = int.parse(overnight);

    double hourlyValue =
        (mainSalary + (dayCount * overnightValue)) / 162.5013762;

    double fridayAndSaturdayAndHolidayValue =
        hourlyValue * 2 * 8 * holidayCount;
    double extraWork =
        (hourlyValue * 1.5 * numberOfHoursPerDay * (dayCount - holidayCount));

    this.fridayAndSaturdayAndHolidayValue = fridayAndSaturdayAndHolidayValue;
    this.extraWork = extraWork;
    this.hourlyValue = hourlyValue;
  }

  void _sumTotalSalary({
    required double mainSalary,
    required double extraWork,
    required double fridayAndSaturdayAndHoliday,
    required int fieldAllowance,
  }) {
    double totalSalary =
        extraWork + fridayAndSaturdayAndHoliday + fieldAllowance + mainSalary;
    this.totalSalary = totalSalary;
  }

  void _solidarityTaxAndGuaranteeTax({
    required double totalSalary,
    required double bonuses,
    required int childrenNum,
    required String maritalStatus,
  }) {
    double solidarityTax = totalSalary * 0.01;
    double guaranteeTax = totalSalary * 0.05125;

    double total = totalSalary - (solidarityTax + guaranteeTax);

    double jihadTax = total * 0.03;

    double incomeTax = _sumIncomeTax(
      total: total,
      childrenNum: childrenNum,
      maritalStatus: maritalStatus,
    ); //(total) * 0.06327;

    double netSalary =
        totalSalary -
        (solidarityTax + guaranteeTax + jihadTax + incomeTax) +
        bonuses;
    this.netSalary = netSalary;
    this.solidarityTax = solidarityTax;
    this.guaranteeTax = guaranteeTax;
    this.jihadTax = jihadTax;
    this.incomeTax = incomeTax;
  }

  double _sumIncomeTax({
    required double total,
    required int childrenNum,
    required String maritalStatus,
  }) {
    int maritalStatusValue = maritalStatus == 'أعزب' ? 150 : 200;
    int childrenNumValue = childrenNum * 25;

    int resultValue = maritalStatusValue + childrenNumValue;

    double result = 0.0;
    if (total < 1000) {
      double smallerThanA1000 = total * 0.05;

      result = smallerThanA1000;
    } else {
      double smallerThanA1000 = 1000 * 0.05;
      double greaterThanA1000 = (total - 1000 - resultValue) * 0.1;
      result = smallerThanA1000 + greaterThanA1000;
    }

    return result;
  }

  void _monthlyInstallmentDiscount({
    required double personalLoan,
    required double personalLoanInstallment,
  }) {
    //double resultPersonalLoan2 = 0;
    //double resultpersonalLoanInstallment = 0;

    if (personalLoan > 0) {
      double resultPersonalLoan = personalLoan;
      double resultpersonalLoanInstallment = personalLoanInstallment;

      if (personalLoan > 0) {
        if (personalLoan >= resultpersonalLoanInstallment) {
          resultPersonalLoan -= resultpersonalLoanInstallment;
        } else {
          resultPersonalLoan = 0;
        }

        // resultpersonalLoanInstallment =
        //     resultPersonalLoan == 0 ? 0 : resultpersonalLoanInstallment;

        personalLoanValue = resultPersonalLoan;
        personalLoanInstallmentValue = resultpersonalLoanInstallment;

        totalSalary -= resultpersonalLoanInstallment;
        netSalary -= resultpersonalLoanInstallment;
      }
    }
  }
}
