import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';

class MainInformationModel extends MainInformationEntity {
  final double mainSalary;
  final int childrenNum;
  final double numberOfHoursPerDay;
  final double personalLoan;
  final double personalLoanInstallment;
  final String overnight;
  final String maritalStatus;

  MainInformationModel({
    required this.mainSalary,
    required this.childrenNum,
    required this.numberOfHoursPerDay,
    required this.personalLoan,
    required this.personalLoanInstallment,
    required this.overnight,
    required this.maritalStatus,
  }) : super(
         mainSalary,
         childrenNum,
         numberOfHoursPerDay,
         personalLoan,
         personalLoanInstallment,
         overnight,
         maritalStatus,
       );

  factory MainInformationModel.empty() => MainInformationModel(
    mainSalary: 0,
    childrenNum: 0,
    numberOfHoursPerDay: 0,
    personalLoan: 0,
    personalLoanInstallment: 0,
    overnight: '',
    maritalStatus: '',
  );

  factory MainInformationModel.fromJson(Map<String, dynamic> json) =>
      MainInformationModel(
        mainSalary: json['mainSalary'],
        childrenNum: json['childrenNum'],
        numberOfHoursPerDay: json['numberOfHoursPerDay'],
        personalLoan: json['personalLoan'],
        personalLoanInstallment: json['personalLoanInstallment'],
        overnight: json['overnight'],
        maritalStatus: json['maritalStatus'],
      );

  Map<String, dynamic> toJson() => {
    'mainSalary': mainSalary,
    'childrenNum': childrenNum,
    'numberOfHoursPerDay': numberOfHoursPerDay,
    'personalLoan': personalLoan,
    'personalLoanInstallment': personalLoanInstallment,
    'overnight': overnight,
    'maritalStatus': maritalStatus,
  };
}
