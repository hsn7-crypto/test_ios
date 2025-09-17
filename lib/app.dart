import 'package:test_ios/core/cubit/init_cubit.dart/init_cubit.dart';
import 'package:test_ios/core/utils/app_colors.dart';
import 'package:test_ios/core/utils/app_router.dart';
import 'package:test_ios/core/utils/functions/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlkhalijApp extends StatelessWidget {
  const AlkhalijApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InitCubit>(
      create: (context) {
        return getIt.get<InitCubit>();
      },
      child: ScreenUtilInit(
        designSize: const Size(360, 740.6),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('ar')],
            locale: const Locale('ar'),
            theme: ThemeData(
              fontFamily: 'Cairo',
              scaffoldBackgroundColor: AppColors.whiteColor,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: AppColors.mainColor,
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.mainColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
