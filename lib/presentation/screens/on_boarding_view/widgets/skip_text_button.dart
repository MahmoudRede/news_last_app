import 'package:flutter/material.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

import 'onboarding_constants.dart';

class SkipTextButton extends StatelessWidget {
  const SkipTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextButton(
          onPressed: () {
            submit(context);
          },
          child:   Text(
            'Skip',
            style: TextStyle(
              color: ColorManager.primaryColor,
              fontSize: SizeConfig.headline2Size,
            ),
          )),
    );
  }
}