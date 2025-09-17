import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class CustomAddCard extends StatelessWidget {
  final TextEditingController? controller;
  final String txt;

  const CustomAddCard({super.key, required this.txt, this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  txt,
                  style: const TextStyle(
                    color: AppColors.greentextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: width(context) * 0.02),
            TextField(
              controller: controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
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
      ),
    );
  }
}
