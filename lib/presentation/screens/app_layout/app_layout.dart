import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

import '../bottom_navigation_bar/manager/bottom_navigation_bar_cubit.dart';
import '../bottom_navigation_bar/views/custom_bottom_nav_bar.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        BottomNavigationBarCubit cubit = BottomNavigationBarCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            shape:  const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            centerTitle: true,
            title: Text(
              cubit.titles[cubit.currentIndex],
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: ColorManager.white,
                fontSize: SizeConfig.headline2Size,
              ),
            ),
          ),
          body: cubit.views[cubit.currentIndex],
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
