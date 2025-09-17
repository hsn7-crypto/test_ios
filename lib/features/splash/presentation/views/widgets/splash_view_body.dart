import 'package:test_ios/core/cubit/init_cubit.dart/init_cubit.dart';
import 'package:test_ios/core/utils/app_assets.dart';
import 'package:test_ios/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late final Animation<double> opacityAnimation;
  late final Animation<double> rotationAnimation;
  late final AnimationController animationController;

  @override
  void initState() {
    initOpacityAnimation();
    context.read<InitCubit>().init();
    navigateToHome();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: opacityAnimation,
            builder: (context, _) {
              return AnimatedOpacity(
                opacity: opacityAnimation.value,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  AppAssets.logoTow,
                  fit: BoxFit.cover,
                  width: 250.w,
                  height: 180.h,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void initOpacityAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacement(AppRouter.layoutView);
    });
  }
}
