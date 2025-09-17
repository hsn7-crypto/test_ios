import 'package:test_ios/core/utils/app_hive.dart';
import 'package:test_ios/features/add_trip/data/models/trip_data.model.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  TripDataEntity trip = TripDataModel.empty();

  void getTripsData() {
    Box<TripDataEntity> tripsBox = Hive.box<TripDataEntity>(AppHive.tripData);
    if (tripsBox.isEmpty) {
      emit(HomeEmptyData());
    } else {
      List<TripDataEntity> tripsData = tripsBox.values.toList();
      tripsData.sort((a, b) => a.startTripDate!.compareTo(b.startTripDate!));
      trip = tripsData.last;

      emit(HomeRefreshData());
    }
  }
}
