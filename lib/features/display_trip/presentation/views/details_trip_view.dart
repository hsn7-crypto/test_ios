import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:test_ios/features/add_trip/presentation/views/widgets/custom_display_friday_and_saturday.dart';
import 'package:test_ios/features/display_trip/presentation/views/widgets/custom_card_net_salary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DetailsTripView extends StatelessWidget {
  const DetailsTripView({super.key});

  @override
  Widget build(BuildContext context) {
    TripDataEntity trip = GoRouterState.of(context).extra as TripDataEntity;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(
            top: 12.h,
            left: 6.w,
            right: 6.w,
            bottom: 12.h,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomDisplayNetSalaryCard(
                title: 'صافي الراتب',
                count: trip.netSalary.toStringAsFixed(3),
                textColor: AppColors.greentextColor,
                valueColor: AppColors.greentextColor,
              ),
            ),
            CustomDisplayFridayAndSaturdayCard(
              title: 'علاوة الحقل',
              count: trip.fieldAllowance.toString(),
              textColor: AppColors.greentextColor,
              valueColor: AppColors.greentextColor,
            ),
            CustomDisplayFridayAndSaturdayCard(
              title: 'العمل الإضافي',
              count: trip.extraWork.toStringAsFixed(3),
              textColor: AppColors.greentextColor,
              valueColor: AppColors.greentextColor,
            ),
            CustomDisplayFridayAndSaturdayCard(
              title: 'الجمعة/السبت/عطل',
              count: trip.fridayAndSaturdayAndHolidayValue.toStringAsFixed(3),
              textColor: AppColors.greentextColor,
              valueColor: AppColors.greentextColor,
            ),
            CustomDisplayFridayAndSaturdayCard(
              title: 'العلاوات',
              count: trip.bonuses.toString(),
              textColor: AppColors.greentextColor,
              valueColor: AppColors.greentextColor,
            ),
            CustomDisplayFridayAndSaturdayCard(
              title: 'خصم التضامن',
              count: trip.solidarityTax.toStringAsFixed(3),
              textColor: AppColors.redColor,
              valueColor: AppColors.redColor,
            ),
            CustomDisplayFridayAndSaturdayCard(
              title: 'خصم الضمان',
              count: trip.guaranteeTax.toStringAsFixed(3),
              textColor: AppColors.redColor,
              valueColor: AppColors.redColor,
            ),
            CustomDisplayFridayAndSaturdayCard(
              title: 'خصم الجهاد',
              count: trip.jihadTax.toStringAsFixed(3),
              textColor: AppColors.redColor,
              valueColor: AppColors.redColor,
            ),
            CustomDisplayFridayAndSaturdayCard(
              title: 'خصم الدخل',
              count: trip.incomeTax.toStringAsFixed(3),
              textColor: AppColors.redColor,
              valueColor: AppColors.redColor,
            ),
            CustomDisplayFridayAndSaturdayCard(
              title: 'الخصومات',
              count: trip.discounts.toStringAsFixed(3),
              textColor: AppColors.redColor,
              valueColor: AppColors.redColor,
            ),
            CustomDisplayFridayAndSaturdayCard(
              title: 'قسط القرض الشهري',
              count: trip.mainInformation.personalLoanInstallment
                  .toStringAsFixed(3),
              textColor: AppColors.redColor,
              valueColor: AppColors.redColor,
            ),
            CustomDisplayFridayAndSaturdayCard(
              title: 'قيمة الساعة',
              count: trip.hourlyValue.toStringAsFixed(3),
              textColor: AppColors.greentextColor,
              valueColor: AppColors.greentextColor,
            ),
            CustomDisplayFridayAndSaturdayCard(
              title: 'إجمالي الراتب',
              count: trip.totalSalary.toStringAsFixed(3),
              textColor: AppColors.greentextColor,
              valueColor: AppColors.greentextColor,
            ),
          ],
        ),
      ),
    );
  }
}
