import 'package:test_ios/constants.dart';
import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/core/utils/app_size.dart';
import 'package:test_ios/core/widgets/my_drop_down_list.dart';
import 'package:test_ios/core/widgets/my_text_field.dart';
import 'package:test_ios/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:test_ios/core/widgets/custom_save_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyInputInformationDataListView extends StatelessWidget {
  const EmptyInputInformationDataListView({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutCubit cubit = context.read<LayoutCubit>();
    return Padding(
      padding: EdgeInsets.only(top: 20.h, right: 10.w, left: 10.w),
      child: Column(
        children: [
          MyTextField(
            hintText: 'الراتب الأساسي',
            controller: cubit.mainSalaryController,
          ),
          SizedBox(height: 20.h),
          MyTextField(
            hintText: 'عدد الساعات لليوم الواحد',
            controller: cubit.numberOfHoursPerDayController,
          ),
          SizedBox(height: 20.h),
          MyDropDownList(
            lable: 'قيمة المبيت لليوم الواحد',
            list: overnightList,
            onSelected: (String? value) {
              cubit.overnight = value!;
            },
          ),
          SizedBox(height: 20.h),
          MyDropDownList(
            lable: 'الحالة الإجتماعية',
            list: genderList,
            onSelected: (String? value) {
              cubit.maritalStatus = value!;
              context.read<LayoutCubit>().canShowChildrenNum(
                maritalStatus: value,
              );
            },
          ),
          SizedBox(height: 20.h),
          BlocBuilder<LayoutCubit, LayoutState>(
            builder: (context, state) {
              return Visibility(
                visible: context.read<LayoutCubit>().isShowChildrenNum,
                child: Column(
                  children: [
                    MyTextField(
                      hintText: 'عددالأبناء',
                      controller: cubit.childrenNumController,
                    ),
                    SizedBox(
                      height: context.read<LayoutCubit>().isShowChildrenNum
                          ? 20.h
                          : 4.h,
                    ),
                  ],
                ),
              );
            },
          ),

          MyTextField(
            hintText: 'القرض الشخصي',
            controller: cubit.personalLoanController,
          ),
          SizedBox(height: 20.h),
          MyTextField(
            hintText: 'قسط القرض الشخصي',
            controller: cubit.personalLoanInstallmentController,
          ),
          //const Spacer(),
          SizedBox(height: 36.h),
          CustomSaveButton(
            txt: 'حفظ',
            width: width(context),
            color: AppColors.mainColor,
            onTap: () {
              context.read<LayoutCubit>().saveMainInformation(context);
            },
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
