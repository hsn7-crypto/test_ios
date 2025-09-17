import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'trip_data_entity.g.dart';

@HiveType(typeId: 1)
class TripDataEntity {
  @HiveField(0)
  final DateTime? startTripDate;
  @HiveField(1)
  final DateTime? endTripDate;
  @HiveField(2)
  final MainInformationEntity mainInformation;
  @HiveField(3)
  final List<DateTime> jobdays;
  @HiveField(4)
  final List<DateTime> holidays;
  @HiveField(5)
  final double totalSalary;
  @HiveField(6)
  final double netSalary;
  @HiveField(7)
  final int fieldAllowance;
  @HiveField(8)
  final double extraWork;
  @HiveField(9)
  final List<DateTime> fridayAndSaturdayHoliday;
  @HiveField(10)
  final double solidarityTax;
  @HiveField(11)
  final double guaranteeTax;
  @HiveField(12)
  final double jihadTax;
  @HiveField(13)
  final double incomeTax;
  @HiveField(14)
  final double bonuses;
  @HiveField(15)
  final double discounts;
  @HiveField(16)
  final double hourlyValue;
  @HiveField(17)
  final double fridayAndSaturdayAndHolidayValue;

  TripDataEntity({
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
  });
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
