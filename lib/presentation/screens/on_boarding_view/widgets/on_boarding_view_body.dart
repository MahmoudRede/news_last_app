import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/screens/on_boarding_view/widgets/skip_text_button.dart';

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
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SkipTextButton(),
          Expanded(child: onboardingItemBuilder()),
          const SizedBox(
            height: 50.0,
          ),
          OnboardingActions(
              onBoardController: onBoardController, isLast: isLast),
        ],
      ),
    );
  }

  PageView onboardingItemBuilder() {
    return PageView.builder(
      itemBuilder: (context, index) => OnboardingItem(
        onboardingModel: items[index],
      ),
      controller: onBoardController,
      itemCount: items.length,
      onPageChanged: (int index) {
        if (index == items.length - 1) {
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


