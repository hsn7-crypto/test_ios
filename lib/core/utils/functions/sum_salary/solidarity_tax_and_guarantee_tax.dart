import 'package:test_ios/core/utils/functions/sum_salary/sum_income_tax.dart';

Map<String, dynamic> solidarityTaxAndGuaranteeTax({
  required double totalSalary,
  required double bonuses,
  required int childrenNum,
  required String maritalStatus,
}) {
  double solidarityTax = totalSalary * 0.01;
  double guaranteeTax = totalSalary * 0.05125;

  double total = totalSalary - (solidarityTax + guaranteeTax);

  double jihadTax = total * 0.03;

  double incomeTax = sumIncomeTax(
    total: total,
    childrenNum: childrenNum,
    maritalStatus: maritalStatus,
  ); //(total) * 0.06327;

  double netSalary =
      totalSalary -
      (solidarityTax + guaranteeTax + jihadTax + incomeTax) +
      bonuses;

  return {
    'solidarityTax': solidarityTax,
    'guaranteeTax': guaranteeTax,
    'jihadTax': jihadTax,
    'netSalary': netSalary,
    'incomeTax': incomeTax,
  };
}
