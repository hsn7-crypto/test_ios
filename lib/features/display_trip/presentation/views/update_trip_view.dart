import 'package:test_ios/features/display_trip/presentation/manager/update_trip/update_trip_cubit.dart';
import 'package:test_ios/features/display_trip/presentation/views/widgets/update_trip_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdateTripView extends StatelessWidget {
  const UpdateTripView({super.key});

  @override
  Widget build(BuildContext context) {
    int index = GoRouterState.of(context).extra as int;

    return BlocProvider<UpdateTripCubit>(
      create: (context) {
        return UpdateTripCubit(index)..init();
      },
      child: const UpdateTripViewBody(),
    );
  }
}
