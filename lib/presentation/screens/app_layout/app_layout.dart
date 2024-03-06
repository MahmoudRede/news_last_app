import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            title: Text(cubit.titles[cubit.currentIndex]),
          ),
          body: cubit.views[cubit.currentIndex],
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
