import 'package:test_ios/features/add_trip/presentation/views/widgets/custom_next_button_add_trip.dart';
import 'package:test_ios/features/add_trip/presentation/views/widgets/custom_previous_button_add_trip.dart';
import 'package:test_ios/features/display_trip/presentation/manager/update_trip/update_trip_cubit.dart';
import 'package:test_ios/features/display_trip/presentation/views/widgets/edit_discounts_and_bonuses.dart';
import 'package:test_ios/features/display_trip/presentation/views/widgets/edit_holiday_in_trip.dart';
import 'package:test_ios/features/display_trip/presentation/views/widgets/edit_main_information_view_body.dart';
import 'package:test_ios/features/display_trip/presentation/views/widgets/edit_start_and_end_date_trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateTripViewBody extends StatelessWidget {
  const UpdateTripViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateTripCubit cubit = context.read<UpdateTripCubit>();

    return WillPopScope(
      onWillPop: () {
        return cubit.backButton(context);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: cubit.pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  cubit.changeIndexPage(index: value);
                },
                children: const [
                  Center(child: EditStartAndEndDateTrip()),
                  Center(child: EditHolidayInTrip()),
                  Center(child: EditTripDiscountsAndBonusesView()),
                  Center(child: EditMainInformationViewBody()),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomNextButtonAddTrip(
                  onPressed: () {
                    cubit.nextButton(context);
                  },
                ),
                CustomPreviousButtonAddTrip(
                  onPressed: () {
                    cubit.previousButton(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
