import 'package:test_ios/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class CustomDisplayFridayAndSaturdayCard extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String count;
  final Color textColor;
  final Color valueColor;

  const CustomDisplayFridayAndSaturdayCard({
    super.key,
    required this.title,
    this.controller,
    required this.count,
    required this.textColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: AppColors.secondaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: width(context) * 0.3,
              margin: EdgeInsets.only(left: width(context) * 0.05),
              padding: const EdgeInsets.symmetric(vertical: 5),
              color: Colors.white,
              alignment: Alignment.center,
              child: Text(
                count,
                style: TextStyle(
                  color: valueColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
