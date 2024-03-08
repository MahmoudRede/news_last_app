import 'package:flutter/cupertino.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Center(
          child: Text(
            onboardingModel.title,
            style:  TextStyle(
                color: ColorManager.primaryColor,
                fontSize: SizeConfig.headline2Size
            ),
          ),
        ),
        Center(
          child: Image(
            image: AssetImage(onboardingModel.image),
            height: SizeConfig.height * 0.35,
            width: double.infinity,
          ),
        ),
        Wrap(
          children: [
            Text(
              onboardingModel.content,
              style:   TextStyle(
                  color: ColorManager.primaryColor,
                   fontSize: SizeConfig.headline3Size
              ),
              textAlign:  TextAlign.end,
            ),
          ],
        ),
      ],
    );
  }
}
