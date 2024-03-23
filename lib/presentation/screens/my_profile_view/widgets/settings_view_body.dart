import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/presentation/widgets/default_button.dart';
import 'package:news_last_app/presentation/widgets/default_text_field.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

import '../../../../styles/app_size/app_size_config.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var userModel = AppCubit.get(context).userModel;
        final TextEditingController nameController = TextEditingController();
        final TextEditingController registerEmailController =
            TextEditingController();
        final TextEditingController registerPhoneController =
            TextEditingController();

        nameController.text = userModel!.userName!;
        registerEmailController.text = userModel.emailAddress!;
        registerPhoneController.text = userModel.phoneNumber!;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              /// user name
              DefaultTextField(
                controller: nameController,
                hintText: "الاسم",
                validator: (value) {
                  if (value!.trim() == "") {
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
                    if (validator!.trim() == "") {
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
                  if (value!.trim() == "") {
                    return "ادخل رقم الهاتف";
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                onTap: () {},
              ),
              defaultButton(
                  onPressed: (){
                    AppCubit.get(context).updateUser(name: nameController.text, phone: registerPhoneController.text);
                  },
                  backGroundColor: ColorManager.primaryColor,
                  height: 30,
                  width: double.infinity,
                  content: const Text('Update',style: TextStyle(color: Colors.white),))
            ],
          ),
        );
      },
    );
  }
}
