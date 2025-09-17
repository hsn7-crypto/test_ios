int getFirstDayOfWeek({
  required int year,
  required int month,
}) {
  return DateTime(
    year,
    month,
    1,
  ).weekday;
}
