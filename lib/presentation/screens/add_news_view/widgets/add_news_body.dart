import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/presentation/widgets/default_text_field.dart';

import '../../../../business_logic/news_cubit/news_cubit.dart';
import '../../../../generated/assets.dart';
import '../../../../styles/app_size/app_size_config.dart';
import '../../../../styles/color_manager/color_manager.dart';
import '../../../widgets/default_button.dart';

class AddNewsBody extends StatelessWidget {
  const AddNewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var detailsController = TextEditingController();
    var headlineController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        if (state is UploadNewsImageSuccessState ||
            state is AddNewsSuccessState) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text('عنوان الخبر',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: SizeConfig.height * 0.025,
                            color: ColorManager.primaryColor)),
                  ),
                  SizedBox(height: SizeConfig.height * 0.01),
                  DefaultTextField(
                      controller: headlineController,
                      hintText: '',
                      validator: (validator) {
                        if (validator!.trim() == '') {
                          return '!!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onTap: () {}),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('تفاصيل الخبر',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: SizeConfig.height * 0.025,
                            color: ColorManager.primaryColor)),
                  ),
                  SizedBox(height: SizeConfig.height * 0.01),
                  DefaultTextField(
                    controller: detailsController,
                    hintText: '',
                    validator: (validator) {
                      if (validator!.trim() == "") {
                        return '!!';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    onTap: () {},
                    maxLines: 10,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('اضافة  صورة',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: SizeConfig.height * 0.025,
                            color: ColorManager.primaryColor)),
                  ),
                  SizedBox(height: SizeConfig.height * 0.01),
                  if (cubit.newsImage != null)
                    Card(
                      elevation: 10,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Image(
                            image: FileImage(cubit.newsImage!),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.3),
                              radius: 18,
                              child: IconButton(
                                  splashRadius: 30.0,
                                  onPressed: () {
                                    cubit.removeImage();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 18.0,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (cubit.newsImage == null)
                    GestureDetector(
                      onTap: () {
                        cubit.pickImage();
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
                        child: Center(
                          child: Image.asset(
                            Assets.uploadImage,
                            width: SizeConfig.width * 0.8,
                            height: SizeConfig.height * 0.1,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 16,
                  ),
                  state is AddNewsLoadingState
                      ? const CircularProgressIndicator(
                          color: ColorManager.primaryColor,
                        )
                      : defaultButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (cubit.newsImage == null) {
                                cubit.addNewsPost(
                                    headline: headlineController.text,
                                    details: detailsController.text);
                              } else {
                                cubit.uploadNewsImage(
                                    headline: headlineController.text,
                                    details: detailsController.text);
                              }
                            }
                          },
                          backGroundColor: ColorManager.primaryColor,
                          height: 30,
                          width: double.infinity,
                          content: const Text(
                            'نشر',
                            style: TextStyle(color: Colors.white),
                          )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
