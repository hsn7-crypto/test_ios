import 'package:test_ios/features/sum_trip/presentation/manager/cubit/sum_trip_cubit.dart';
import 'package:test_ios/features/sum_trip/presentation/views/widgets/sum_trip_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SumTripView extends StatelessWidget {
  const SumTripView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SumTripCubit>(
      create: (context) => SumTripCubit(),
      child: const SumTripViewBody(),
    );
  }
}
