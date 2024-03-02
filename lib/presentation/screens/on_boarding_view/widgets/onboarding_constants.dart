import 'package:news_last_app/core/app_routes/app_routes.dart';
import 'package:news_last_app/core/local/shared_preferences.dart';
import 'package:news_last_app/data/models/on_boarding_model.dart';
import 'package:news_last_app/generated/assets.dart';
import 'package:news_last_app/presentation/screens/home_screen/home_screen/home_screen.dart';

bool onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;

final List<OnboardingModel> items = [
  OnboardingModel(
      image: Assets.imagesFacebook,
      title: 'Body 1',
      body: 'handleWindowFocusChanged mWindowFocusChanged'),
  OnboardingModel(
      image: Assets.imagesFacebook,
      title: 'Body 2',
      body: 'handleWindowFocusChanged mWindowFocusChanged'),
  OnboardingModel(
      image: Assets.imagesFacebook,
      title: 'Body 3',
      body: 'handleWindowFocusChanged mWindowFocusChanged'),
];

void submit(context) {
  CacheHelper.setBool(key: 'onBoarding', value: true).then((value) {
    if (value) {
      customPushAndRemoveUntil(context, const HomeScreen());
    }
  });
}
