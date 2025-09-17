import 'package:test_ios/core/cubit/init_cubit.dart/init_cubit.dart';
import 'package:test_ios/features/add_trip/data/data_source/trip_data_Local_data_source.dart';
import 'package:test_ios/features/add_trip/data/repos/trip_data_repo_impl.dart';
import 'package:test_ios/features/display_trip/data/data_source/fetch_trip_data_Local_data_source.dart';
import 'package:test_ios/features/display_trip/data/repos/fetch_trip_data_repo_impl.dart';
import 'package:test_ios/features/main_information/data/data_sources/main_information_local_data_source.dart';
import 'package:test_ios/features/main_information/data/repos/main_information_repo_impl.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<InitCubit>(InitCubit());

  getIt.registerSingleton<MainInformationRepoImpl>(
    MainInformationRepoImpl(
      mainInformationLocalDataSource: MainInformationLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<TripDataRepoImpl>(
    TripDataRepoImpl(TripDataLocalDataSourceImpl()),
  );
  getIt.registerSingleton<FetchTripDataRepoImpl>(
    FetchTripDataRepoImpl(FetchTripDataLocalDataSourceImpl()),
  );
}
