import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/bot_nav_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:news_last_app/business_logic/bot_nav_bar_cubit/bottom_navigation_bar_state.dart';
import 'package:news_last_app/presentation/screens/admin_screen/admin_layout/widgets/admin_nav_bar.dart';
import 'package:news_last_app/presentation/screens/bottom_navigation_bar/views/custom_bottom_nav_bar.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class AdminLayout extends StatelessWidget {
  const AdminLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        BottomNavigationBarCubit cubit = BottomNavigationBarCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            // backgroundColor: ColorManager.primaryColor,
            centerTitle: true,
            title: Text(cubit.adminTitles[cubit.currentIndex],
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorManager.white)
            ),
          ),
          body: cubit.adminViews[cubit.currentIndex],
          bottomNavigationBar: const AdminNavBar(),
        );
      },
    );
  }
}
