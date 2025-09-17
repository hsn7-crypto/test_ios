import 'package:test_ios/features/add_trip/presentation/views/widgets/add_trip_view_bloc_provider.dart';
import 'package:test_ios/features/display_trip/presentation/views/details_trip_view.dart';
import 'package:test_ios/features/display_trip/presentation/views/display_trip_screen.dart';
import 'package:test_ios/features/display_trip/presentation/views/update_trip_view.dart';
import 'package:test_ios/features/home/presentation/views/home_view.dart';
import 'package:test_ios/features/layout/presentation/views/layout_view.dart';
import 'package:test_ios/features/main_Information/presentation/views/main_Information_view.dart';
import 'package:test_ios/features/splash/presentation/views/splash_view.dart';
import 'package:test_ios/features/sum_trip/presentation/views/result_sum_trip_view.dart';
import 'package:test_ios/features/sum_trip/presentation/views/sum_trip_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splashView = '/';
  static const String layoutView = '/layoutView';
  static const String homeView = '/homeView';
  static const String mainInformationView = '/mainInformationView';
  static const String addTrip = '/addTrip';
  static const String addHolidayInTrip = '/addHolidayInTrip';
  static const String displayView = '/displayView';
  static const String detailsTripView = '/detailsTripView';
  static const String editTripView = '/editTripView';
  static const String sumTripView = '/sumTripView';
  static const String resultSumTripView = '/resultSumTripView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: layoutView,
        builder: (context, state) => const LayoutView(),
      ),
      GoRoute(path: homeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: mainInformationView,
        builder: (context, state) => const MainInformationView(),
      ),
      GoRoute(
        path: addTrip,
        builder: (context, state) => const AddTripViewBlocProvider(),
      ),
      GoRoute(
        path: displayView,
        builder: (context, state) => const DisplayTripView(),
      ),
      GoRoute(
        path: detailsTripView,
        builder: (context, state) => const DetailsTripView(),
      ),
      GoRoute(
        path: editTripView,
        builder: (context, state) => const UpdateTripView(),
      ),
      GoRoute(
        path: sumTripView,
        builder: (context, state) => const SumTripView(),
      ),
      GoRoute(
        path: resultSumTripView,
        builder: (context, state) => const ResultSumTripView(),
      ),
    ],
  );
}
