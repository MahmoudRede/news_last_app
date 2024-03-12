import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/presentation/screens/Login_screen/login_screen.dart';
import 'package:news_last_app/presentation/screens/app_layout/app_layout.dart';
import 'package:news_last_app/presentation/screens/home_screen/home_screen/home_screen.dart';
import 'package:news_last_app/presentation/widgets/default_button.dart';
import 'package:news_last_app/presentation/widgets/default_text_field.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController registerEmailController = TextEditingController();
    final TextEditingController registerPasswordController = TextEditingController();
    final TextEditingController registerPhoneController = TextEditingController();

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          registerEmailController.clear();
          registerPhoneController.clear();
          registerPasswordController.clear();
          registerPasswordController.clear();
          Get.offAll(() => const AppLayout(),);
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
            height: SizeConfig.height,
            width: SizeConfig.width,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Lottie.asset(
                      'assets/images/login.json',
                      height: MediaQuery.of(context).size.height * .25,
                      width: MediaQuery.of(context).size.height * .25,
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .02,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          "إنشاء حساب جديد",
                          style: TextStyle(
                              color: ColorManager.primaryColor,
                              fontSize: SizeConfig.headline3Size
                          )
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .02,
                    ),
                    Form(
                      key: registerFormKey,
                      child: Column(
                        children: [

                          /// user name
                          DefaultTextField(
                            controller: nameController,
                            hintText: "الاسم",
                            validator: (value) {
                              if (value!.trim()=="") {
                                return "ادخل الاسم";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onTap: () {},
                          ),
                          SizedBox(
                            height: SizeConfig.height * .03,
                          ),

                          /// email
                          DefaultTextField(
                              controller: registerEmailController,
                              hintText: "البريد الالكتروني",
                              isPassword: false,
                              validator: (validator) {
                                if (validator!.trim()=="") {
                                  return "أدخل البريد الالكتروني";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              onTap: () {}),
                          SizedBox(
                            height: SizeConfig.height * .03,
                          ),

                          /// phone number
                          DefaultTextField(
                            controller: registerPhoneController,
                            hintText: "رقم الهاتف",
                            validator: (value) {
                              if (value!.trim()=="") {
                                return "ادخل رقم الهاتف";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            onTap: () {},
                          ),
                          SizedBox(
                            height: SizeConfig.height * .03,
                          ),

                          /// password
                          DefaultTextField(
                              controller: registerPasswordController,
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
                            height: SizeConfig.height * .03,
                          ),
                         state is SignUpLoadingState ? const Center(child: CircularProgressIndicator( color: ColorManager.primaryColor,),) :
                          DefaultButton(
                            onPressed: () {
                              if (registerFormKey.currentState!
                                  .validate()) {
                                cubit.createAccountWithFirebaseAuth(
                                    password: registerPasswordController.text,
                                    name: nameController.text,
                                    emailAddress: registerEmailController.text,
                                    phoneNumber: registerPhoneController.text,
                                    context: context);
                              }
                            },
                            backGroundColor: ColorManager.primaryColor,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * .06,
                            width: SizeConfig.height * .5,
                            content: Text(
                                "إنشاء حساب",
                                style: TextStyle(color: ColorManager.white,
                                    fontSize: SizeConfig.headline3Size)
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.height * .04,
                          ),

                          /// don't have an account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "لديك حساب بالفعل؟",
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const LoginScreen());
                                },
                                child: const Text(
                                  "تسجيل الدخول",
                                  style: TextStyle(
                                      color: ColorManager.primaryColor),
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
        );
      },
    );
  }
}
