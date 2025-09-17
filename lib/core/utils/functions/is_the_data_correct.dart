import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:dartz/dartz.dart';

Either<String, bool> isTheDataCorrect(MainInformationEntity mainInformation) {
  int correctCount = 0;
  if (mainInformation.mainSalary == 0) {
    return left('يرجى إدخال المرتب الأساسي, لا تتركه فارغاً');
  }
  correctCount++;
  if (mainInformation.numberOfHoursPerDay == 0) {
    return left('يرجى إدخال عدد الساعات لليوم الواحد, لا تتركه فارغاً');
  }
  correctCount++;
  if (mainInformation.overnight == '0') {
    return left('يرجى إختيار قيمة المبيت');
  }
  correctCount++;
  if (mainInformation.maritalStatus == '0') {
    return left('يرجى إختيار الحالة الإجتماعية');
  }
  correctCount++;

  return correctCount == 4 ? right(true) : right(false);
}

Either<String, bool> isTheDataCorrectMainInformation({
  required String mainSalary,
  required String numberOfHoursPerDay,
  required double personalLoan,
  required double personalLoanInstallment,
}) {
  if (mainSalary.isEmpty) {
    return left('يرجى إدخال المرتب الأساسي, لا تتركه فارغاً');
  }

  if (numberOfHoursPerDay.isEmpty) {
    return left('يرجى إدخال عدد الساعات لليوم الواحد, لا تتركه فارغاً');
  }

  if (personalLoanInstallment > personalLoan) {
    return left('قسط القرض الشخصي يجب أن لا يكون أكبر من القرض الشخصي');
  }

  return right(true);
}

Either<String, bool> isTheDataCorrectSumTrip({
  required String mainSalary,
  required String numberOfHoursPerDay,
  required String dayCount,
  required String satAndfridayCount,
}) {
  if (mainSalary.isEmpty) {
    return left('يرجى إدخال المرتب الأساسي, لا تتركه فارغاً');
  }

  if (numberOfHoursPerDay.isEmpty) {
    return left('يرجى إدخال عدد الساعات لليوم الواحد, لا تتركه فارغاً');
  }

  if (dayCount.isEmpty) {
    return left('يرجى إدخال عدد أيام العمل, لا تتركه فارغاً');
  }

  if (satAndfridayCount.isEmpty) {
    return left('يرجى إدخال عدد العطل, لا تتركه فارغاً');
  }

  return right(true);
}
