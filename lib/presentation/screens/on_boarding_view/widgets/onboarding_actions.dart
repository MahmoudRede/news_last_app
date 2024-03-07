import 'package:flutter/material.dart';
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
    return Row(
      children: [
        SmoothPageIndicator(
          controller: onBoardController,
          effect: const SwapEffect(
            radius: 10,
            activeDotColor: Colors.tealAccent,
            dotColor: Colors.blue,
          ),
          count: onBoardingItems.length,
        ),
        const Spacer(),
        FloatingActionButton(
          backgroundColor: ColorManager.blue.withOpacity(.6),
          onPressed: () {
            onBoardController.nextPage(
                duration: const Duration(milliseconds: 750),
                curve: Curves.easeInQuint);
            if (isLast == true) {
              submit(context);
            }
          },
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: ColorManager.white,
          ),
        )
      ],
    );
  }
}