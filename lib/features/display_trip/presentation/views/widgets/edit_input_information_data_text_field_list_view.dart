import 'package:test_ios/constants.dart';
import 'package:test_ios/core/widgets/my_drop_down_list.dart';
import 'package:test_ios/core/widgets/my_text_field.dart';
import 'package:test_ios/features/display_trip/presentation/manager/update_trip/update_trip_cubit.dart';
import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditInputInformationDataTextFieldListView extends StatelessWidget {
  const EditInputInformationDataTextFieldListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateTripCubit, UpdateTripState>(
      builder: (context, state) {
        UpdateTripCubit cubit = context.read<UpdateTripCubit>();
        MainInformationEntity mainInformation =
            MainInformationEntity.fromMainInformationEntity(
              cubit.mainInformation!,
            );
        return ListView(
          children: [
            SizedBox(height: 16.h),
            MyTextField(
              controller: cubit.mainSalaryController,
              hintText: 'الراتب الأساسي',
              onChanged: (value) {},
            ),
            SizedBox(height: 32.h),
            MyTextField(
              controller: cubit.numberOfHoursPerDayController,
              hintText: 'عدد الساعات لليوم الواحد',
              onChanged: (value) {},
            ),
            SizedBox(height: 32.h),
            MyDropDownList(
              lable: 'قيمة المبيت لليوم الواحد',
              list: overnightList,
              onSelected: (value) {
                mainInformation.setOvernight = value!;
              },
            ),
            SizedBox(height: 32.h),
            MyDropDownList(
              lable: 'الحالة الإجتماعية',
              list: genderList,
              onSelected: (value) {
                mainInformation.setMaritalStatus = value!;
                context.read<UpdateTripCubit>().canShowChildrenNum(
                  maritalStatus: value,
                );
              },
            ),
            SizedBox(height: 32.h),
            Visibility(
              visible: cubit.isShowChildrenNum,
              child: MyTextField(
                controller: cubit.childrenNumController,
                hintText: 'عددالأبناء',
                onChanged: (val) {
                  mainInformation.setChildrenNum = val;
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
