import 'dart:developer';

import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/core/utils/app_router.dart';
import 'package:test_ios/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:test_ios/features/home/presentation/views/widgets/home_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    log('message');
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getTripsData(),
      child: Scaffold(
        floatingActionButton: Container(
          margin: EdgeInsets.only(left: 8.w, right: 8.w),
          child: ElevatedButton.icon(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.addTrip);
            },
            icon: const Icon(
              Icons.add_rounded,
              size: 24,
              color: AppColors.whiteColor,
            ),
            label: Text(
              'إضافة رحلة',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6),
              backgroundColor: AppColors.buttonGreenColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
              elevation: 5,
              shadowColor: Colors.black26,
            ),
          ),
        ),
        body: const HomeViewBlocBuilder(),
      ),
    );
  }
}
