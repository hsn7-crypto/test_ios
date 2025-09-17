import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/core/utils/app_size.dart';
import 'package:test_ios/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomInformationSalaryCard extends StatelessWidget {
  final TextEditingController? controller;
  final String txt;
  final String hintText;
  final void Function(String)? onChanged;

  const CustomInformationSalaryCard({
    super.key,
    required this.txt,
    this.controller,
    required this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Column(
        children: [
          Row(children: [Text(txt, style: AppTextStyles.font18BoldGreen)]),
          SizedBox(height: width(context) * 0.02),
          TextField(
            controller: controller,
            onChanged: onChanged,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              fillColor: AppColors.whiteColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
