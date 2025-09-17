import 'package:test_ios/core/utils/app_size.dart';
import 'package:test_ios/features/main_information/presentation/views/widgets/input_information_data_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';

class MainInformationViewBody extends StatelessWidget {
  const MainInformationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context),
      width: width(context),
      //padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: const SingleChildScrollView(
        child: InputInformationDataListViewBlocBuilder(),
      ),
    );
  }
}
