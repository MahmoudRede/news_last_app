import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/core/app_routes/app_routes.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

import '../../../business_logic/bot_nav_bar_cubit/bottom_navigation_bar_cubit.dart';
import '../../../business_logic/bot_nav_bar_cubit/bottom_navigation_bar_state.dart';
import '../bottom_navigation_bar/views/custom_bottom_nav_bar.dart';
import '../settings_view/settings_view.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        BottomNavigationBarCubit cubit = BottomNavigationBarCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(cubit.titles[cubit.currentIndex],
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorManager.white)),
            leading: const Icon(Icons.notifications),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    customPushNavigator(context, const SettingsView());
                  },
                ),
              )
            ],
          ),
          body: cubit.views[cubit.currentIndex],
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
