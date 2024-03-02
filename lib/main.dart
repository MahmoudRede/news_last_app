import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/screens/splash_view/splash_view.dart';
import 'package:news_last_app/styles/theme_manager/theme_manager.dart';

import 'core/local/shared_preferences.dart';
import 'presentation/screens/on_boarding_view/widgets/onboarding_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(MyApp(
    onBoarding: onBoarding,
  ));
}

class MyApp extends StatelessWidget {
  final bool onBoarding;

  const MyApp({super.key, required this.onBoarding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(context),
      home: const SplashView(),
    );
  }
}
