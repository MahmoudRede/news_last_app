import 'package:news_last_app/core/app_routes/app_routes.dart';
import 'package:news_last_app/core/local/cash_helper.dart';
import 'package:news_last_app/data/models/on_boarding_model.dart';
import 'package:news_last_app/generated/assets.dart';
import 'package:news_last_app/presentation/screens/start_screen/start_screen.dart';

bool onBoarding = CashHelper.getData(key: 'onBoarding') ?? false;

final List<OnboardingModel> onBoardingItems = [
  OnboardingModel(
      image: "assets/images/onboarding_news.jpg",
      content: 'A freelancer is a self-employed individual who offers services to clients on a project basis, often working remotely and managing their own business',
      title: 'Body 1',
      body: 'handleWindowFocusChanged mWindowFocusChanged'),
  OnboardingModel(
      image: "assets/images/onboarding_add_event.jpg",
      content:
          'We ate constantly adding your favourite restaurant throughout the territory and around your area carefully selected',
      title: 'Body 2',
      body: 'handleWindowFocusChanged mWindowFocusChanged'),
  OnboardingModel(
      image: "assets/images/onboarding_share.jpg",
      content:
          ' it is easy to determine the exact number of calories consumed at each meal',
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
