import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:news_last_app/presentation/screens/Login_screen/login_screen.dart';
import 'package:news_last_app/presentation/screens/app_layout/app_layout.dart';
import 'package:news_last_app/presentation/screens/bottom_navigation_bar/manager/bottom_navigation_bar_cubit.dart';
import 'package:news_last_app/presentation/screens/on_boarding_view/on_boarding_view.dart';
import 'package:news_last_app/presentation/screens/on_boarding_view/widgets/onboarding_constants.dart';
import 'package:news_last_app/presentation/screens/register_screen/register_screen.dart';
import 'package:news_last_app/presentation/screens/splash_view/splash_view.dart';
import 'package:news_last_app/presentation/screens/start_screen/start_screen.dart';
import 'package:news_last_app/styles/theme_manager/theme_manager.dart';

import 'block_observer.dart';
import 'business_logic/app_cubit/app_cubit.dart';
import 'business_logic/localization_cubit/app_localization.dart';
import 'business_logic/localization_cubit/localization_cubit.dart';
import 'business_logic/localization_cubit/localization_states.dart';
import 'constants/constants.dart';
import 'core/local/cash_helper.dart';
import 'firebase_options.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  uId = CashHelper.getData(key: 'isUid');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                AppCubit()..getUser(id: uId == null ? uId = '' : uId!)),
        BlocProvider(
            create: (context) => LocalizationCubit()..fetchLocalization()),
        BlocProvider(create: (context) => BottomNavigationBarCubit()),
      ],
      child: BlocConsumer<LocalizationCubit, LocalizationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getApplicationTheme(context),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("en", ""),
              Locale("ar", ""),
            ],
            locale: LocalizationCubit.get(context).appLocal,
            localeResolutionCallback: (currentLang, supportLang) {
              if (currentLang != null) {
                for (Locale locale in supportLang) {
                  if (locale.languageCode == currentLang.languageCode) {
                    return currentLang;
                  }
                }
              }
              return supportLang.first;
            },
              home: const OnboardingView(),
          );
        },
      ),
    );
  }
}
