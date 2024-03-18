import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_last_app/business_logic/localization_cubit/localization_cubit.dart';
import 'package:news_last_app/core/local/cash_helper.dart';
import 'package:news_last_app/presentation/screens/Login_screen/login_screen.dart';
import 'package:news_last_app/presentation/widgets/default_button.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorManager.white,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Lottie.asset(
              'assets/images/login.json',
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.height * .3,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Text(
              "مرحباً!",
              style: TextStyle(
                color: ColorManager.primaryColor,
                fontSize: SizeConfig.headline1Size,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Text(
              "يرجي تسجيل الدخول إلي حسابك",
              style: TextStyle(
                color: ColorManager.grey,
                fontSize: SizeConfig.headline3Size,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .07,
            ),
            defaultButton(
              onPressed: () {
                Get.to(() => const LoginScreen(), transition: Transition.fadeIn);
              },
              backGroundColor: ColorManager.primaryColor,
              height: MediaQuery.sizeOf(context).height * .06,
              width: MediaQuery.sizeOf(context).width * .6,
              content: Text(
                "تسجيل الدخول",
                style: TextStyle(
                  color: ColorManager.white,
                  fontSize: SizeConfig.headline3Size,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
