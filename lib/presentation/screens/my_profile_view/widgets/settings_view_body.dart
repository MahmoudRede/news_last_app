import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/generated/assets.dart';
import 'package:news_last_app/presentation/screens/my_profile_view/widgets/picked_image_view.dart';
import 'package:news_last_app/presentation/widgets/default_button.dart';
import 'package:news_last_app/presentation/widgets/default_text_field.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

import '../../../../styles/app_size/app_size_config.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is ProfileImagePickerSuccessState) {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const PickedImageView();
              });
        }
      },
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
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            radius: 70.0,
                            child: CircleAvatar(
                              radius: 70.0,
                              backgroundColor: Colors.white,
                              backgroundImage: userModel.image == null
                                  ? const AssetImage(
                                      Assets.imagesProfilePic,
                                    )
                                  : NetworkImage(userModel.image!)
                                      as ImageProvider,
                            ),
                          ),
                          if (state is UploadProfilePhotoLoadingState)
                            CircleAvatar(
                              radius: 70.0,
                              backgroundColor: Colors.grey.withOpacity(0.5),
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.7),
                        radius: 16,
                        child: IconButton(
                            splashRadius: 25.0,
                            onPressed: () {
                              AppCubit.get(context).getProfileImage();
                            },
                            icon: const Icon(
                              Icons.camera,
                              color: Colors.white,
                              size: 16.0,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
          
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
                  enable: false,
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
                  enable: false,
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
                SizedBox(
                  height: SizeConfig.height * .03,
                ),
                defaultButton(
                    onPressed: () {
                      AppCubit.get(context).updateUser(
                          name: nameController.text,
                          phone: registerPhoneController.text);
                    },
                    backGroundColor: ColorManager.primaryColor,
                    height: 30,
                    width: double.infinity,
                    content: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
