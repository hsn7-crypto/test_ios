double sumIncomeTax({
  required double total,
  required int childrenNum,
  required String maritalStatus,
}) {
  int maritalStatusValue = maritalStatus == 'أعزب' ? 150 : 200;
  int childrenNumValue = childrenNum * 25;

  int resultValue = maritalStatusValue + childrenNumValue;

  double result = 0.0;
  if (total < 1000) {
    double smallerThanA1000 = 1000 - resultValue * 0.05;
    result = smallerThanA1000;
  } else {
    double smallerThanA1000 = 1000 * 0.05;
    double greaterThanA1000 = (total - 1000 - resultValue) * 0.1;
    result = smallerThanA1000 + greaterThanA1000;
  }
  return result;
}
