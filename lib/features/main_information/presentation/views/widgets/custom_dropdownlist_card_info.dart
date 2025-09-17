import 'package:test_ios/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class CustomDropdownCardInfo extends StatelessWidget {
  final String initialSelection;
  final String hintText;
  final List list;
  final void Function(String?)? onSelected;
  const CustomDropdownCardInfo({
    super.key,
    required this.list,
    this.onSelected,
    required this.initialSelection,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: DropdownMenu<String>(
        width: width(context) * 0.89,
        hintText: hintText,
        initialSelection: initialSelection,
        onSelected: onSelected,
        dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((val) {
          return DropdownMenuEntry<String>(value: val, label: val);
        }).toList(),
      ),
    );
  }
}
