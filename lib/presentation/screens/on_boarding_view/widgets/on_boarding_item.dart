import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_last_app/data/models/on_boarding_model.dart';
import 'package:news_last_app/presentation/screens/on_boarding_view/widgets/onboarding_constants.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.onboardingModel});

 final OnboardingModel onboardingModel ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        Lottie.asset(
          onboardingModel.image,
          height: SizeConfig.height * 0.35,
          width: SizeConfig.height * 0.4,
        ),
        SizedBox(height: SizeConfig.height * 0.04,),
        Text(
          onboardingModel.title,
          style: TextStyle(
              color: ColorManager.textColor,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.height*.032
          ),
          textAlign:  TextAlign.end,
        ),
        SizedBox(height: SizeConfig.height * 0.04,),
        Text(
          onboardingModel.content,
          style: TextStyle(
              color: ColorManager.grey,
               fontSize: SizeConfig.headline3Size
          ),
          textAlign:  TextAlign.center,
        ),
      ],
    );
  }
}
