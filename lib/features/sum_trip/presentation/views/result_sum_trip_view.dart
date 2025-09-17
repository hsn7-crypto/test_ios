import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/features/add_trip/presentation/views/widgets/custom_display_friday_and_saturday.dart';
import 'package:test_ios/features/display_trip/presentation/views/widgets/custom_card_net_salary.dart';
import 'package:test_ios/features/sum_trip/data/models/result_sum_trip_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultSumTripView extends StatelessWidget {
  const ResultSumTripView({super.key});

  @override
  Widget build(BuildContext context) {
    ResultSumTripModel resultSumTripData =
        GoRouterState.of(context).extra as ResultSumTripModel;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
        children: [
          CustomDisplayNetSalaryCard(
            title: 'صافي الراتب',
            count: resultSumTripData.netSalary.toStringAsFixed(3),
            textColor: AppColors.greentextColor,
            valueColor: AppColors.greentextColor,
          ),
          CustomDisplayFridayAndSaturdayCard(
            title: 'علاوة الحقل',
            count: resultSumTripData.fieldAllowance.toStringAsFixed(3),
            textColor: AppColors.greentextColor,
            valueColor: AppColors.greentextColor,
          ),
          CustomDisplayFridayAndSaturdayCard(
            title: 'العمل الإضافي',
            count: resultSumTripData.extraWork.toStringAsFixed(3),
            textColor: AppColors.greentextColor,
            valueColor: AppColors.greentextColor,
          ),
          CustomDisplayFridayAndSaturdayCard(
            title: 'الجمعة/السبت/عطل',
            count: resultSumTripData.fridayAndSaturdayAndHoliday
                .toStringAsFixed(3),
            textColor: AppColors.greentextColor,
            valueColor: AppColors.greentextColor,
          ),
          CustomDisplayFridayAndSaturdayCard(
            title: 'خصم التضامن',
            count: resultSumTripData.solidarityTax.toStringAsFixed(3),
            textColor: AppColors.redColor,
            valueColor: AppColors.redColor,
          ),
          CustomDisplayFridayAndSaturdayCard(
            title: 'خصم الضمان',
            count: resultSumTripData.guaranteeTax.toStringAsFixed(3),
            textColor: AppColors.redColor,
            valueColor: AppColors.redColor,
          ),
          CustomDisplayFridayAndSaturdayCard(
            title: 'خصم الجهاد',
            count: resultSumTripData.jihadTax.toStringAsFixed(3),
            textColor: AppColors.redColor,
            valueColor: AppColors.redColor,
          ),
          CustomDisplayFridayAndSaturdayCard(
            title: 'خصم الدخل',
            count: resultSumTripData.incomeTax.toStringAsFixed(3),
            textColor: AppColors.redColor,
            valueColor: AppColors.redColor,
          ),
          CustomDisplayFridayAndSaturdayCard(
            title: 'قيمة الساعة',
            count: resultSumTripData.hourlyValue.toStringAsFixed(3),
            textColor: AppColors.greentextColor,
            valueColor: AppColors.greentextColor,
          ),
          CustomDisplayFridayAndSaturdayCard(
            title: 'إجمالي الراتب',
            count: resultSumTripData.totalSalary.toStringAsFixed(3),
            textColor: AppColors.greentextColor,
            valueColor: AppColors.greentextColor,
          ),
        ],
      ),
    );
  }
}
