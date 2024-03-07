import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

import 'widgets/on_boarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: ColorManager.white,
          body: OnboardingViewBody(),
    ));
  }
}
