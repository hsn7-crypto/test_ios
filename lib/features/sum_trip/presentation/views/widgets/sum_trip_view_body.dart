import 'package:test_ios/constants.dart';
import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/core/utils/app_size.dart';
import 'package:test_ios/core/widgets/custom_save_button.dart';
import 'package:test_ios/core/widgets/my_drop_down_list.dart';
import 'package:test_ios/core/widgets/my_text_field.dart';
import 'package:test_ios/features/sum_trip/presentation/manager/cubit/sum_trip_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SumTripViewBody extends StatelessWidget {
  const SumTripViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SumTripCubit cubit = context.read<SumTripCubit>();
    return ListView(
      padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w, bottom: 10),
      children: [
        MyTextField(
          hintText: 'الراتب الأساسي',
          controller: cubit.mainSalaryController,
        ),
        SizedBox(height: 16.h),
        MyTextField(
          hintText: 'عدد أيام العمل',
          controller: cubit.dayCountController,
        ),
        SizedBox(height: 16.h),
        MyTextField(
          hintText: 'عدد جمعة/سبت',
          controller: cubit.satAndfridayCountController,
        ),
        SizedBox(height: 16.h),
        MyTextField(
          hintText: 'عدد العطل والأعياد',
          controller: cubit.holidayCountController,
        ),
        SizedBox(height: 16.h),
        MyDropDownList(
          lable: 'قيمة المبيت لليوم الواحد',
          list: overnightList,
          onSelected: (String? value) {
            cubit.overnight = value!;
          },
        ),
        SizedBox(height: 16.h),
        MyTextField(
          hintText: 'عدد الساعات لليوم الواحد',
          controller: cubit.numberOfHoursPerDayController,
        ),
        SizedBox(height: 16.h),
        MyTextField(
          hintText: 'قسط القرض الشخصي',
          controller: cubit.personalLoanInstallmentController,
        ),
        SizedBox(height: 16.h),
        MyDropDownList(
          lable: 'الحالة الإجتماعية',
          list: genderList,
          onSelected: (String? value) {
            cubit.maritalStatus = value!;

            cubit.canShowChildrenNum(maritalStatus: value);
          },
        ),
        SizedBox(height: 16.h),
        BlocBuilder<SumTripCubit, SumTripState>(
          builder: (context, state) {
            return Visibility(
              visible: cubit.isShowChildrenNum,
              child: MyTextField(
                hintText: 'عددالأبناء',
                controller: cubit.childrenNumController,
              ),
            );
          },
        ),
        SizedBox(height: 16.h),
        MyTextField(
          hintText: 'أي علاوات أخرى',
          controller: cubit.bonusesController,
        ),
        SizedBox(height: 64.h),
        Padding(
          padding: EdgeInsets.only(right: 5.w, left: 5.w),
          child: CustomSaveButton(
            txt: 'حساب الراتب',
            width: width(context),
            color: AppColors.mainColor,
            onTap: () {
              cubit.sumTrip(context);
            },
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
