import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/business_logic/bot_nav_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:news_last_app/core/app_routes/app_routes.dart';
import 'package:news_last_app/generated/assets.dart';
import 'package:news_last_app/presentation/screens/app_layout/app_layout.dart';
import 'package:news_last_app/presentation/widgets/custom_toast.dart';
import 'package:news_last_app/presentation/widgets/default_button.dart';
import 'package:news_last_app/presentation/widgets/default_text_field.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class AddThanksBody extends StatelessWidget {
  const AddThanksBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController personController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  /// title of optional add photo
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('إضافة صورة (إختياري)',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: SizeConfig.height * 0.025,
                            color: ColorManager.primaryColor)),
                  ),
                  SizedBox(height: SizeConfig.height * 0.02),

                  /// container of upload image
                  GestureDetector(
                    onTap: () {
                      cubit.getThanksImage();
                    },
                    child: Container(
                      width: SizeConfig.width,
                      height: SizeConfig.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.primaryColor,
                          width: 1,
                          style: BorderStyle.values[1],
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: cubit.thanksImage == null
                          ? Center(
                              child: Image.asset(
                                Assets.uploadImage,
                                width: SizeConfig.width * 0.8,
                                height: SizeConfig.height * 0.1,
                              ),
                            )
                          : state is GetThanksImagePickerLoadingState
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Image(
                                  image: FileImage(cubit.thanksImage!),
                                ),
                    ),
                  ),

                  SizedBox(height: SizeConfig.height * 0.03),

                  /// text of person name
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('المرسل اليه',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: SizeConfig.height * 0.025,
                            color: ColorManager.primaryColor)),
                  ),
                  SizedBox(height: SizeConfig.height * 0.01),

                  /// text form field to enter the person name
                  DefaultTextField(
                      controller: personController,
                      hintText: '',
                      isPassword: false,
                      enable: true,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return 'أدخل اسم الشخص';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onTap: () {}),
                  SizedBox(height: SizeConfig.height * 0.03),

                  /// text of message title
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('عنوان الرسالة',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: SizeConfig.height * 0.025,
                            color: ColorManager.primaryColor)),
                  ),
                  SizedBox(height: SizeConfig.height * 0.01),

                  /// text form field to enter the person name
                  DefaultTextField(
                      controller: titleController,
                      hintText: '',
                      isPassword: false,
                      enable: true,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return 'أدخل عنوان الرسالة';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onTap: () {}),
                  SizedBox(height: SizeConfig.height * 0.03),

                  /// text of the description of the message
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('مضمون الشكر',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: SizeConfig.height * 0.025,
                            color: ColorManager.primaryColor)),
                  ),
                  SizedBox(height: SizeConfig.height * 0.01),

                  /// text form field of the description of the message
                  DefaultTextField(
                      controller: descriptionController,
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
                 state is UploadThanksLoadingState? const Center(child: CircularProgressIndicator()):  DefaultButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.uploadThanksImage();
                        cubit.uploadThanks(
                          personName: personController.text,
                          messageTitle: titleController.text,
                          messageBody: descriptionController.text,
                          image: cubit.thanksImageUrl,
                        ).then((value) {
                          personController.clear();
                          titleController.clear();
                          descriptionController.clear();
                          cubit.thanksImage = null;
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
