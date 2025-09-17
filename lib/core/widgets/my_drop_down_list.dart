import 'package:test_ios/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class MyDropDownList extends StatelessWidget {
  const MyDropDownList({
    super.key,
    required this.lable,
    this.onSelected,
    required this.list,
  });
  final String lable;
  final Function(String?)? onSelected;
  final List<String> list;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: DropdownMenu<String>(
        label: Text(lable),
        width: width(context) * 0.942,
        initialSelection: list.first,
        onSelected: onSelected,
        dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((val) {
          return DropdownMenuEntry<String>(value: val, label: val);
        }).toList(),
      ),
    );
  }
}
