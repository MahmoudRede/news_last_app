import 'package:flutter/material.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.darkBlueColor,
      body: SplashViewBody(),
    );
  }
}
