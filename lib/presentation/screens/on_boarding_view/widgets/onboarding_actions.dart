import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/widgets/default_button.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_constants.dart';

class OnboardingActions extends StatelessWidget {
  const OnboardingActions({
    super.key,
    required this.onBoardController,
    required this.isLast,
  });

  final PageController onBoardController;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      content: isLast? const Text('Get Started',style: TextStyle(
          color: ColorManager.white
      ),): const Text('Next',style: TextStyle(
        color: ColorManager.white
      ),),

      backGroundColor: ColorManager.primaryColor,
      height: SizeConfig.height*.05,
      width: SizeConfig.height*.5,
      onPressed: () {
        onBoardController.nextPage(
            duration: const Duration(milliseconds: 600),
            curve: Curves.fastEaseInToSlowEaseOut);
        if (isLast == true) {
          submit(context);
        }
      },

    );
  }
}