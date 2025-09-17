double sumTotalSalary({
  required double mainSalary,
  required double extraWork,
  required double fridayAndSaturdayAndHoliday,
  required double fieldAllowance,
}) {
  double result =
      extraWork + fridayAndSaturdayAndHoliday + fieldAllowance + mainSalary;

  return result;
}
