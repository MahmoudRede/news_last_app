import 'package:flutter/material.dart';
import 'package:news_last_app/data/models/on_boarding_model.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.onboardingModel});

 final OnboardingModel onboardingModel ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Expanded(
          child: Center(
            child: Image(
              image: AssetImage(onboardingModel.image),
              height: 350.0,
              width: double.infinity,
            ),
          ),
        ),
        Text(
          onboardingModel.content,
          style:   TextStyle(
              color: ColorManager.primaryColor,
               fontSize: SizeConfig.headline2Size
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          onboardingModel.body,
          style:  TextStyle(
              color: ColorManager.primaryColor,
              fontSize: SizeConfig.headline2Size
          ),
        ),
      ],
    );
  }
}
