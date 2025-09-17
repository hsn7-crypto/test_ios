import 'package:test_ios/core/widgets/my_text_field.dart';
import 'package:test_ios/features/display_trip/presentation/manager/update_trip/update_trip_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditTripDiscountsAndBonusesView extends StatelessWidget {
  const EditTripDiscountsAndBonusesView({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateTripCubit cubit = context.read<UpdateTripCubit>();
    return Padding(
      padding: EdgeInsets.only(top: 32.h, right: 16.w, left: 16.w),
      child: Column(
        children: [
          MyTextField(
            hintText: 'علاوات',
            controller: cubit.bonusesTextController,
          ),
          SizedBox(height: 32.h),
          MyTextField(
            hintText: 'خصومات',
            controller: cubit.discountsTextController,
          ),
        ],
      ),
    );
  }
}
