import 'package:test_ios/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:test_ios/features/layout/presentation/views/widgets/custom_drawer.dart';
import 'package:test_ios/features/layout/presentation/views/widgets/empty_main_information_view_body.dart';
import 'package:test_ios/features/layout/presentation/views/widgets/my_snake_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LayoutCubit>(
      create: (context) => LayoutCubit()..getMainInformation(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          if (state is LayoutMainInformationEmpty ||
              state is LayoutMainInformationIsShowChildrenNum) {
            return const EmptyMainInformationViewBody();
          }
          LayoutCubit cubit = context.read<LayoutCubit>();

          return Scaffold(
            appBar: AppBar(),
            drawer: const CustomDrawer(),
            bottomNavigationBar: MySnakeNavigationBar(
              selectedIndex: cubit.selectedIndex,
              onItemSelected: (index) {
                cubit.changeIndex(index);
              },
            ),
            /*
             CustomBottomNavigationBar(
              selectedIndex: cubit.selectedIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
            */
            body: cubit.pages[cubit.selectedIndex],
          );
        },
      ),
    );
  }
}
