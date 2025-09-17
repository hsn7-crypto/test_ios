import 'package:test_ios/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:test_ios/features/home/presentation/views/widgets/total_and_net_salary_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalAndNetSalaryCard extends StatelessWidget {
  const TotalAndNetSalaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return Row(
      children: [
        Expanded(
          child: TotalAndNetSalaryItem(
            text: 'إجمالي المرتب',
            salary: cubit.trip.totalSalary,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: TotalAndNetSalaryItem(
            text: 'إجمالي صافي المرتب',
            salary: cubit.trip.netSalary,
          ),
        ),
      ],
    );
  }
}
