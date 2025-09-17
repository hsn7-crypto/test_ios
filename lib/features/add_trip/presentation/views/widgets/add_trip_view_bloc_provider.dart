import 'package:test_ios/core/utils/functions/setup_service_locator.dart';
import 'package:test_ios/features/add_trip/data/repos/trip_data_repo_impl.dart';
import 'package:test_ios/features/add_trip/domain/use_cases/save_trip_data_use_case.dart';
import 'package:test_ios/features/add_trip/presentation/manager/trip_data/trip_data_cubit.dart';
import 'package:test_ios/features/add_trip/presentation/views/add_trip_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTripViewBlocProvider extends StatelessWidget {
  const AddTripViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<TripDataCubit>(
        create: (context) {
          return TripDataCubit(
            saveTripDataUseCase: SaveTripDataUseCase(
              getIt.get<TripDataRepoImpl>(),
            ),
          );
        },
        child: const AddTripView(),
      ),
    );
  }
}
