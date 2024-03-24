import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/bot_nav_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:news_last_app/business_logic/bot_nav_bar_cubit/bottom_navigation_bar_state.dart';
import 'package:news_last_app/presentation/screens/bottom_navigation_bar/views/widgets/bottom_navigation_bar_constants.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';


class AdminNavBar extends StatelessWidget {
  const AdminNavBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        BottomNavigationBarCubit cubit = BottomNavigationBarCubit.get(context);
        return BottomNavigationBar(
            elevation: MediaQuery.sizeOf(context).height*.02,
            backgroundColor:  ColorManager.white,
            selectedItemColor: ColorManager.primaryColor,
            onTap: (index) {
              cubit.changeBotNavViews(index);
            },
            currentIndex: cubit.currentIndex,
            items: adminNavItems
        );
      },
    );
  }
}
