import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/presentation/screens/bottom_navigation_bar/views/widgets/bottom_navigation_bar_constants.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

import '../manager/bottom_navigation_bar_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

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
            items: botNavItems);
      },
    );
  }
}
