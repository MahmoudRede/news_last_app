import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/presentation/screens/app_layout/app_layout.dart';
import 'package:news_last_app/presentation/screens/register_screen/register_screen.dart';
import 'package:news_last_app/presentation/widgets/default_button.dart';
import 'package:news_last_app/presentation/widgets/default_text_field.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Get.offAll(() => const AppLayout() );
        }
      },
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.white,
          appBar: AppBar(
            toolbarHeight: 0.0,
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Lottie.asset(
                        'assets/images/login.json',
                        height: MediaQuery.of(context).size.height * .3,
                        width: MediaQuery.of(context).size.height * .3,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "مرحباً!",
                          style: TextStyle(
                            color: ColorManager.primaryColor,
                            fontSize: SizeConfig.headline2Size,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Form(
                        key: loginFormKey,
                        child: Column(
                          children: [
                            /// email
                            DefaultTextField(
                                controller: emailController,
                                hintText: "رقم الهاتف",
                                isPassword: false,
                                validator: (validator) {
                                  if (validator!.trim()=="") {
                                    return "أدخل رقم الهاتف";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                onTap: () {}),
                            SizedBox(
                              height: SizeConfig.height * .03,
                            ),

                            /// password
                            DefaultTextField(
                                controller: passwordController,
                                hintText: "كلمة المرور",
                                isPassword: true,
                                validator: (validator) {
                                  if (validator!.trim()=="") {
                                    return "أدخل كلمة المرور";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                onTap: () {}),
                            SizedBox(
                              height: SizeConfig.height * .04,
                            ),

                            /// login button
                            state is LoginLoadingState ? const CircularProgressIndicator( color: ColorManager.primaryColor,) :
                             defaultButton(
                              onPressed: () {
                                if (loginFormKey.currentState!.validate()) {
                                  cubit.loginWithFirebaseAuth(
                                      context: context,
                                      emailAddress: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              backGroundColor: ColorManager.primaryColor,
                              height: MediaQuery.of(context).size.height * .06,
                              width: SizeConfig.height * .5,
                              content: Text("تسجيل الدخول",
                                  style: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: SizeConfig.headline3Size)),
                            ),
                            SizedBox(
                              height: SizeConfig.height * .04,
                            ),

                            /// don't have an account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "ليس لديك حساب؟",
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => const RegisterScreen());
                                  },
                                  child:  const Text(
                                    "إنشاء حساب",
                                    style: TextStyle(
                                        color: ColorManager.primaryColor,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
