import 'package:news_last_app/core/app_routes/app_routes.dart';
import 'package:news_last_app/core/local/cash_helper.dart';
import 'package:news_last_app/data/models/on_boarding_model.dart';
import 'package:news_last_app/generated/assets.dart';
import 'package:news_last_app/presentation/screens/start_screen/start_screen.dart';

bool onBoarding = CashHelper.getData(key: 'onBoarding') ?? false;

final List<OnboardingModel> onBoardingItems = [
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
  CashHelper.saveData(key: 'onBoarding', value: true).then((value) {
    if (value) {
      customPushAndRemoveUntil(context, const StartScreen());
    }
  });
}
