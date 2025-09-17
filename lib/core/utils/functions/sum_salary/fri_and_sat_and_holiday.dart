Map<String, double> friAndSatAndHoliday({
  required double mainSalary,
  required String overnight,
  required int numberOfHoursPerDay,
  required int dayCount,
  required int holidayCount,
}) {
  int overnightValue = int.parse(overnight);

  double result = (mainSalary + (dayCount * overnightValue)) / 162.5013762;

  double fridayAndSaturdayAndHoliday = result * 2 * 8 * holidayCount;
  double extraWork =
      (result * 1.5 * numberOfHoursPerDay * (dayCount - holidayCount));

  return {
    'fridayAndSaturdayAndHoliday': fridayAndSaturdayAndHoliday,
    'extraWork': extraWork,
  };
}
