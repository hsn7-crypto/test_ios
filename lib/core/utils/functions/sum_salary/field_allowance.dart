int fieldAllowance({required String overnightValue, required int dayCount}) {
  int overnight = int.parse(overnightValue);
  int result = dayCount * overnight;
  return result;
}
