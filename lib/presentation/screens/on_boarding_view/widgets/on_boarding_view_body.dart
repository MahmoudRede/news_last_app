import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/screens/on_boarding_view/widgets/skip_text_button.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'on_boarding_item.dart';
import 'onboarding_actions.dart';
import 'onboarding_constants.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  var onBoardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: SizeConfig.height * 0.02,
        vertical: SizeConfig.height * 0.015,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SkipTextButton(),
          Expanded(child: onboardingItemBuilder()),
          Align(
            alignment: Alignment.center,
            child: SmoothPageIndicator(
              controller: onBoardController,
              effect:  SwapEffect(
                radius: 7,
                dotHeight:10,
                dotWidth: 10,
                activeDotColor: ColorManager.grey,
                dotColor: ColorManager.primaryColor,
              ),
              count: onBoardingItems.length,
            ),
          ),
          SizedBox(
            height: SizeConfig.height * 0.08,
          ),
          OnboardingActions(
              onBoardController: onBoardController,
              isLast: isLast
          ),
          SizedBox(
            height: SizeConfig.height * 0.025,
          ),
        ],
      ),
    );
  }

  PageView onboardingItemBuilder() {
    return PageView.builder(
      itemBuilder: (context, index) => OnboardingItem(
        onboardingModel: onBoardingItems[index],
      ),
      controller: onBoardController,
      itemCount: onBoardingItems.length,
      onPageChanged: (int index) {
        if (index == onBoardingItems.length - 1) {
          setState(() {
            isLast = true;
          });
        } else {
          setState(() {
            isLast = false;
          });
        }
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}


