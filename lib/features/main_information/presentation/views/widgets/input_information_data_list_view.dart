import 'package:test_ios/constants.dart';
import 'package:test_ios/core/utils/app_size.dart';
import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/core/widgets/my_drop_down_list.dart';
import 'package:test_ios/core/widgets/my_text_field.dart';
import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:test_ios/features/main_information/presentation/manager/main_information_data/main_information_cubit.dart';
import 'package:test_ios/core/widgets/custom_save_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputInformationDataListView extends StatelessWidget {
  final MainInformationEntity mainInformation;
  const InputInformationDataListView({
    super.key,
    required this.mainInformation,
  });

  @override
  Widget build(BuildContext context) {
    MainInformationCubit cubit = context.read<MainInformationCubit>();
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

              context.read<MainInformationCubit>().canShowChildrenNum(
                maritalStatus: value,
              );
            },
          ),
          SizedBox(height: 20.h),
          Visibility(
            visible: context.read<MainInformationCubit>().isShowChildrenNum,
            child: MyTextField(
              hintText: 'عددالأبناء',
              controller: cubit.childrenNumController,
            ),
          ),
          SizedBox(
            height: context.read<MainInformationCubit>().isShowChildrenNum
                ? 20.h
                : 4.h,
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
          SizedBox(height: 36.h),
          CustomSaveButton(
            txt: 'حفظ',
            width: width(context),
            color: AppColors.mainColor,
            onTap: () {
              context.read<MainInformationCubit>().saveMainInformationData(
                context: context,
              );
            },
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
