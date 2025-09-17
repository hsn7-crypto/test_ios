import 'package:test_ios/core/utils/app_size.dart';
import 'package:test_ios/features/display_trip/presentation/views/widgets/edit_input_information_data_text_field_list_view.dart';
import 'package:flutter/material.dart';

class EditMainInformationViewBody extends StatelessWidget {
  const EditMainInformationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context),
      width: width(context),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: const EditInputInformationDataTextFieldListView(),
    );
  }
}
