import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

ThemeData getApplicationTheme (BuildContext context) {

  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Tajawal',
    colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.white),

    /// AppBar Theme
    appBarTheme:  AppBarTheme(
      backgroundColor: ColorManager.primaryColor,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: ColorManager.primaryColor,
      ),
      iconTheme: const IconThemeData(
        color: ColorManager.white,
      ),
      titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(),
    ),

    /// text theme
    textTheme:  TextTheme(
      headlineSmall: const TextStyle(
          fontSize: 13, fontFamily: 'Tajawal', color: ColorManager.black),
      headlineMedium: TextStyle(
          fontSize: MediaQuery.sizeOf(context).height*.029, fontFamily: 'Tajawal', color: ColorManager.black),
      headlineLarge:   TextStyle(
          fontSize: MediaQuery.sizeOf(context).height*.04, fontFamily: 'Tajawal', color: ColorManager.black),
    ),


    /// Bottom Navigation Bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        color: ColorManager.primaryColor,
        fontSize: MediaQuery.sizeOf(context).height * 0.017,
      ),
      unselectedLabelStyle: TextStyle(
        color: ColorManager.black,
        fontSize: MediaQuery.sizeOf(context).height * 0.014,
      ),
      selectedItemColor: ColorManager.primaryColor,
      unselectedItemColor: ColorManager.black.withOpacity(.3),
      selectedIconTheme:  IconThemeData(
        color: ColorManager.primaryColor,
        size: MediaQuery.sizeOf(context).width * 0.061,
      ),
      unselectedIconTheme: IconThemeData(
        color: ColorManager.black.withOpacity(.3),
        size: MediaQuery.sizeOf(context).width * 0.06,
      ),
    ),


  );

}