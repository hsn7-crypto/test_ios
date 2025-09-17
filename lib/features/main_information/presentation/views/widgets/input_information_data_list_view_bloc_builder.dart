import 'package:test_ios/features/main_information/presentation/manager/main_information_data/main_information_cubit.dart';
import 'package:test_ios/features/main_information/presentation/views/widgets/input_information_data_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputInformationDataListViewBlocBuilder extends StatelessWidget {
  const InputInformationDataListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainInformationCubit, MainInformationState>(
      builder: (context, state) {
        if (state is MainInformationSuccess) {
          return InputInformationDataListView(
            mainInformation: state.mainInformationEntity,
          );
        } else if (state is MainInformationEmpty) {
          return InputInformationDataListView(
            mainInformation: state.mainInformationEntity,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
