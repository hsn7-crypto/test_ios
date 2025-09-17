import 'package:test_ios/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:test_ios/features/home/presentation/views/widgets/empty_calendar.dart';
import 'package:test_ios/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBlocBuilder extends StatelessWidget {
  const HomeViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeEmptyData) {
          return const EmptyCalendar();
        }
        return const HomeViewBody();
      },
    );
  }
}
