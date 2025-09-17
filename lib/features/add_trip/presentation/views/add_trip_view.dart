import 'package:test_ios/features/add_trip/presentation/manager/trip_data/trip_data_cubit.dart';
import 'package:test_ios/features/add_trip/presentation/views/widgets/my_page_view.dart';
import 'package:test_ios/features/add_trip/presentation/views/widgets/next_and_previous_button_add_trip_range_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTripView extends StatelessWidget {
  const AddTripView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return context.read<TripDataCubit>().backButton();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<TripDataCubit, TripDataState>(
          builder: (context, state) {
            TripDataCubit cubit = context.read<TripDataCubit>();
            return Column(
              children: [
                MyPageView(
                  controller: context.read<TripDataCubit>().pageController,
                  onPageChanged: (value) {
                    cubit.changeIndexPage(index: value);
                  },
                ),
                NextAndPreviousButtonAddTripRangeView(
                  onPressedNext: () {
                    cubit.nextButton(context);
                  },
                  onPressedPrevious: () {
                    cubit.previousButton(context);
                  },
                ),
                SizedBox(height: 16.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
