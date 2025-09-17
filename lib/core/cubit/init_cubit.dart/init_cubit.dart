import 'package:test_ios/core/utils/app_hive.dart';
import 'package:test_ios/core/utils/functions/simple_bloc_observer.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'init_state.dart';

class InitCubit extends Cubit<InitState> {
  InitCubit() : super(InitInitial());

  void init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MainInformationEntityAdapter());
    Hive.registerAdapter(TripDataEntityAdapter());
    await Hive.openBox<MainInformationEntity>(AppHive.mainInformation);
    await Hive.openBox<TripDataEntity>(AppHive.tripData);
    Bloc.observer = SimpleBlocObserver();
  }
}
