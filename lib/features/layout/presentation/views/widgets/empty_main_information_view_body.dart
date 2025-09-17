import 'package:test_ios/core/utils/app_size.dart';
import 'package:test_ios/core/utils/app_string.dart';
import 'package:test_ios/features/layout/presentation/views/widgets/empty_input_information_data_list_view.dart';
import 'package:flutter/material.dart';

class EmptyMainInformationViewBody extends StatelessWidget {
  const EmptyMainInformationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.mainInformation),
      ),
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: const SingleChildScrollView(
          child: EmptyInputInformationDataListView(),
        ),
      ),
    );
  }
}
