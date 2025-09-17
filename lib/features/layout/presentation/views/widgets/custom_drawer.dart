import 'package:test_ios/core/utils/app_assets.dart';
import 'package:test_ios/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.mainInformationView);
                },
                title: const Text('البيانات الرئيسية'),
                leading: Image.asset(AppAssets.mainInformation, width: 35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
