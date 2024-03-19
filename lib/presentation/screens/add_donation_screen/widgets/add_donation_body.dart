import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/business_logic/bot_nav_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:news_last_app/core/app_routes/app_routes.dart';
import 'package:news_last_app/presentation/screens/app_layout/app_layout.dart';
import 'package:news_last_app/presentation/widgets/custom_toast.dart';
import 'package:news_last_app/presentation/widgets/default_button.dart';
import 'package:news_last_app/presentation/widgets/default_text_field.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class AddDonationBody extends StatelessWidget {
  const AddDonationBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController messageController = TextEditingController();
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    final cubit = AppCubit.get(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              /// text of the description of the message
              Align(
                alignment: Alignment.centerRight,
                child: Text('رسالة التهنئة',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: SizeConfig.height * 0.025,
                        color: ColorManager.primaryColor)),
              ),
              SizedBox(height: SizeConfig.height * 0.01),

              /// text form field of the description of the message
              DefaultTextField(
                  controller: messageController,
                  hintText: '',
                  maxLines: 10,
                  isPassword: false,
                  enable: true,
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'أدخل الرسالة';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onTap: () {}),
              SizedBox(height: SizeConfig.height * 0.03),

              /// upload button
              DefaultButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {

                    cubit.uploadDonation(
                      messageBody: messageController.text,
                    ).then((value) {
                      messageController.clear();
                      BottomNavigationBarCubit.get(context).currentIndex = 0;
                      customToast(title: "تمت الاضافة بنجاح", color: ColorManager.green);
                      customPushAndRemoveUntil(context, const AppLayout());
                    });
                  }
                },
                backGroundColor: ColorManager.primaryColor,
                height: SizeConfig.height * 0.06,
                width: SizeConfig.width,
                content: Text('إضافة',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ColorManager.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
