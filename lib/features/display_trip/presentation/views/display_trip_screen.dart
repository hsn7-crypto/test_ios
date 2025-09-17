import 'package:test_ios/core/utils/app_assets.dart';
import 'package:test_ios/core/utils/app_size.dart';
import 'package:test_ios/core/utils/functions/setup_service_locator.dart';
import 'package:test_ios/features/display_trip/data/repos/fetch_trip_data_repo_impl.dart';
import 'package:test_ios/features/display_trip/domain/use_cases/fetch_trip_data_use_case.dart';
import 'package:test_ios/features/display_trip/presentation/manager/fetch_trip_data/fetch_trip_data_cubit.dart';
import 'package:test_ios/features/display_trip/presentation/views/widgets/data_trip_month_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class DisplayTripView extends StatelessWidget {
  const DisplayTripView({super.key});
  final bool isEmptyMonthDataList = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FetchTripDataCubit>(
      create: (context) => FetchTripDataCubit(
        fetchTripDataUseCase: FetchTripDataUseCase(
          getIt.get<FetchTripDataRepoImpl>(),
        ),
      )..fetchTripData(),
      child: Scaffold(
        body: BlocBuilder<FetchTripDataCubit, FetchTripDataState>(
          builder: (context, state) {
            if (state is FetchTripDataLoaded) {
              return DataTripMonthListView(trips: state.tripDataEntity);
            } else if (state is FetchTripDataEmptyData) {
              return Center(
                child: Lottie.asset(
                  AppAssets.noCalendar,
                  fit: BoxFit.fill,
                  height: width(context),
                  repeat: false,
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
