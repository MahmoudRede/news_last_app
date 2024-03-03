import 'package:flutter/material.dart';
import 'package:news_last_app/data/models/on_boarding_model.dart';

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
          onboardingModel.title,
          style: const TextStyle(
              color: Colors.white,
              fontWeight:FontWeight.bold,
              fontSize: 30.0
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          onboardingModel.body,
          style:const TextStyle(
              color: Colors.white,
              fontSize: 20.0
          ),
        ),
      ],
    );
  }
}
