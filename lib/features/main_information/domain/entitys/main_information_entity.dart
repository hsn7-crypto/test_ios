import 'package:hive/hive.dart';

part 'main_information_entity.g.dart';

@HiveType(typeId: 0)
class MainInformationEntity {
  @HiveField(0)
  double mainSalary;
  @HiveField(1)
  int childrenNum;
  @HiveField(2)
  double numberOfHoursPerDay;
  @HiveField(3)
  double personalLoan;
  @HiveField(4)
  double personalLoanInstallment;
  @HiveField(5)
  String overnight;
  @HiveField(6)
  String maritalStatus;

  MainInformationEntity(
    this.mainSalary,
    this.childrenNum,
    this.numberOfHoursPerDay,
    this.personalLoan,
    this.personalLoanInstallment,
    this.overnight,
    this.maritalStatus,
  );

  factory MainInformationEntity.fromMainInformationEntity(
      MainInformationEntity mainInformationEntity) {
    return MainInformationEntity(
      mainInformationEntity.mainSalary,
      mainInformationEntity.childrenNum,
      mainInformationEntity.numberOfHoursPerDay,
      mainInformationEntity.personalLoan,
      mainInformationEntity.personalLoanInstallment,
      mainInformationEntity.overnight,
      mainInformationEntity.maritalStatus,
    );
  }
  factory MainInformationEntity.empty() {
    return MainInformationEntity(
      0,
      0,
      0,
      0,
      0,
      '0',
      '0',
    );
  }

  set setMainSalary(String salary) {
    if (salary.isNotEmpty) {
      mainSalary = double.parse(salary);
    }
  }

  set setChildrenNum(String num) {
    if (num.isNotEmpty) {
      childrenNum = int.parse(num);
    }
  }

  set setNumberOfHoursPerDay(String num) {
    if (num.isNotEmpty) {
      numberOfHoursPerDay = double.parse(num);
    }
  }

  set setPersonalLoan(String personalLoan) {
    if (personalLoan.isNotEmpty) {
      this.personalLoan = double.parse(personalLoan);
    }
  }

  set setPersonalLoanInstallment(String personalLoanInstallment) {
    if (personalLoanInstallment.isNotEmpty) {
      this.personalLoanInstallment = double.parse(personalLoanInstallment);
    }
  }

  set setOvernight(String overnight) {
    this.overnight = overnight;
  }

  set setMaritalStatus(String maritalStatus) {
    this.maritalStatus = maritalStatus;
  }

  MainInformationEntity clone() {
    return MainInformationEntity(
      mainSalary,
      childrenNum,
      numberOfHoursPerDay,
      personalLoan,
      personalLoanInstallment,
      overnight,
      maritalStatus,
    );
  }
}
