import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:test_ios/features/main_information/data/models/main_information_model.dart';
import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TripDataModel extends TripDataEntity {
  DateTime? startTripDate;
  DateTime? endTripDate;
  /////////////////////////
  MainInformationEntity mainInformation;
  ////////////////////////
  List<DateTime> jobdays;
  List<DateTime> holidays;
  double totalSalary;
  double netSalary;
  final int fieldAllowance;
  final double extraWork;
  final double fridayAndSaturdayAndHolidayValue;
  List<DateTime> fridayAndSaturdayHoliday;
  double solidarityTax;
  double guaranteeTax;
  double jihadTax;
  double incomeTax;
  final double bonuses;
  final double discounts;
  double hourlyValue;

  factory TripDataModel.empty() {
    return TripDataModel(
      startTripDate: null,
      endTripDate: null,
      mainInformation: MainInformationModel.empty(),
      jobdays: [],
      holidays: [],
      totalSalary: 0,
      netSalary: 0,
      fieldAllowance: 0,
      extraWork: 0,
      fridayAndSaturdayHoliday: [],
      solidarityTax: 0,
      guaranteeTax: 0,
      jihadTax: 0,
      incomeTax: 0,
      bonuses: 0,
      discounts: 0,
      hourlyValue: 0,
      fridayAndSaturdayAndHolidayValue: 0,
    );
  }

  factory TripDataModel.fromEntity(TripDataEntity tripDataEntity) {
    return TripDataModel(
      startTripDate: tripDataEntity.startTripDate,
      endTripDate: tripDataEntity.endTripDate,
      mainInformation: tripDataEntity.mainInformation,
      jobdays: tripDataEntity.jobdays,
      holidays: tripDataEntity.holidays,
      totalSalary: tripDataEntity.totalSalary,
      netSalary: tripDataEntity.netSalary,
      fieldAllowance: tripDataEntity.fieldAllowance,
      extraWork: tripDataEntity.extraWork,
      fridayAndSaturdayHoliday: tripDataEntity.fridayAndSaturdayHoliday,
      solidarityTax: tripDataEntity.solidarityTax,
      guaranteeTax: tripDataEntity.guaranteeTax,
      jihadTax: tripDataEntity.jihadTax,
      incomeTax: tripDataEntity.incomeTax,
      bonuses: tripDataEntity.bonuses,
      discounts: tripDataEntity.discounts,
      hourlyValue: tripDataEntity.hourlyValue,
      fridayAndSaturdayAndHolidayValue:
          tripDataEntity.fridayAndSaturdayAndHolidayValue,
    );
  }

  factory TripDataModel.fromSumSalary({
    required MainInformationEntity mainInformationValue,
    required double totalSalary,
    required double netSalary,
    required int fieldAllowance,
    required double extraWork,
    required double fridayAndSaturdayAndHolidayValue,
    required double solidarityTax,
    required double guaranteeTax,
    required double jihadTax,
    required double incomeTax,
    required double hourlyValue,
    required double bonuses,
    required double discounts,
    required DateTime startTripDate,
    required DateTime endTripDate,
    required List<DateTime> jobdays,
    required List<DateTime> holidays,
    required List<DateTime> fridayAndSaturdayHoliday,
  }) {
    return TripDataModel(
      startTripDate: startTripDate,
      endTripDate: endTripDate,
      mainInformation: mainInformationValue,
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
  }

  TripDataModel({
    required this.fridayAndSaturdayAndHolidayValue,
    required this.startTripDate,
    required this.endTripDate,
    required this.mainInformation,
    required this.jobdays,
    required this.holidays,
    required this.totalSalary,
    required this.netSalary,
    required this.fieldAllowance,
    required this.extraWork,
    required this.fridayAndSaturdayHoliday,
    required this.solidarityTax,
    required this.guaranteeTax,
    required this.jihadTax,
    required this.incomeTax,
    required this.bonuses,
    required this.discounts,
    required this.hourlyValue,
  }) : super(
         bonuses: bonuses,
         mainInformation: mainInformation,
         discounts: discounts,
         endTripDate: endTripDate,
         extraWork: extraWork,
         fridayAndSaturdayAndHolidayValue: fridayAndSaturdayAndHolidayValue,
         fieldAllowance: fieldAllowance,
         fridayAndSaturdayHoliday: fridayAndSaturdayHoliday,
         guaranteeTax: guaranteeTax,
         holidays: holidays,
         hourlyValue: hourlyValue,
         incomeTax: incomeTax,
         jihadTax: jihadTax,
         jobdays: jobdays,
         netSalary: netSalary,
         solidarityTax: solidarityTax,
         startTripDate: startTripDate,
         totalSalary: totalSalary,
       );

  bool toggleStartAndEndTripDate({required PickerDateRange? date}) {
    bool isToggle = false;
    if (date != null) {
      isToggle = true;
      startTripDate = date.startDate;
      endTripDate = date.endDate;
    }

    return isToggle;
  }

  bool toggleStartAndEndTripDateFromRangeDate({
    required List<PickerDateRange>? rangeDate,
  }) {
    bool isToggle = false;
    if (rangeDate != null) {
      isToggle = true;
      startTripDate = rangeDate.first.startDate;
      endTripDate = rangeDate.last.endDate;
    }

    return isToggle;
  }

  set setStartTripDate(DateTime dateTime) {
    startTripDate = dateTime;
  }

  set setEndTripDate(DateTime dateTime) {
    endTripDate = dateTime;
  }

  void clearjobdayAndholiday() {
    jobdays.clear();
    holidays.clear();
    fridayAndSaturdayHoliday.clear();
  }

  void addMonthSalary({
    required double solidarityTax,
    required double guaranteeTax,
    required double jihadTax,
    required double incomeTax,
    required double hourlyValue,
    required double netSalary,
    required double totalSalary,
  }) {
    this.solidarityTax += solidarityTax;
    this.guaranteeTax += guaranteeTax;
    this.jihadTax += jihadTax;
    this.incomeTax += incomeTax;
    this.hourlyValue += hourlyValue;
    this.netSalary += netSalary;
    this.totalSalary += totalSalary;
  }

  @override
  String toString() {
    return ('''startTripDate ===> $startTripDate
               endTripDate ===> $endTripDate
               mainSalary ===> ${mainInformation.mainSalary}
               childrenNum ===> ${mainInformation.childrenNum}
               numberOfHoursPerDayalary ===> ${mainInformation.numberOfHoursPerDay}
               overnight ===> ${mainInformation.overnight}
               maritalStatus ===> ${mainInformation.maritalStatus}
               jobdays ===> $jobdays
               holidays ===> $holidays
               totalSalary ===> $totalSalary
               netSalary ===> $netSalary
               fieldAllowance ===> $fieldAllowance
               extraWork ===> $extraWork
               fridayAndSaturdayHoliday ===> $fridayAndSaturdayHoliday
               solidarityTax ===> $solidarityTax
               guaranteeTax ===> $guaranteeTax
               jihadTax ===> $jihadTax
               incomeTax ===> $incomeTax
               bonuses ===> $bonuses
               discounts ===> $discounts
               personalLoanInstallment ===> ${mainInformation.personalLoanInstallment}
               hourlyValue ===> $hourlyValue
            ''');
  }
}
