import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_last_app/core/app_routes/app_routes.dart';
import 'package:news_last_app/presentation/screens/home_screen/home_screen/home_screen.dart';
import 'package:news_last_app/presentation/screens/on_boarding_view/on_boarding_view.dart';
import 'package:news_last_app/presentation/screens/on_boarding_view/widgets/onboarding_constants.dart';
import 'package:news_last_app/presentation/screens/splash_view/widgets/fade_widget.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeWidget(fadeAnimation: fadeAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    fadeAnimation =
        Tween<double>(begin: -0.5, end: 1).animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      if(onBoarding){
        customPushNavigator(context, const HomeScreen());
      }else{
        customPushNavigator(context, const OnboardingView());
      }

    });
  }
}
