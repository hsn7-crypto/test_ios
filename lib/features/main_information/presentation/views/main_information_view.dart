import 'package:test_ios/core/utils/app_string.dart';
import 'package:test_ios/core/utils/functions/setup_service_locator.dart';
import 'package:test_ios/features/main_Information/presentation/views/widgets/main_information_view_body.dart';
import 'package:test_ios/features/main_information/data/repos/main_information_repo_impl.dart';
import 'package:test_ios/features/main_information/domain/use_cases/fetch_main_information_data_use_case.dart';
import 'package:test_ios/features/main_information/domain/use_cases/save_main_information_data_use_case.dart';
import 'package:test_ios/features/main_information/presentation/manager/main_information_data/main_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainInformationView extends StatelessWidget {
  const MainInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainInformationCubit>(
      create: (context) {
        return MainInformationCubit(
          FetchMainInformationDataUseCase(getIt.get<MainInformationRepoImpl>()),
          SaveMainInformationDataUseCase(getIt.get<MainInformationRepoImpl>()),
        )..fetchMainInformationData();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.mainInformation),
          centerTitle: true,
        ),
        body: const MainInformationViewBody(),
      ),
    );
  }
}
