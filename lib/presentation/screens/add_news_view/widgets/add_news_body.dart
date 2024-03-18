import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  TextFormField(
                    controller: headlineController,
                    decoration: const InputDecoration(hintText: 'عنوان الخبر'),
                    validator: (validator) {
                      if (validator!.trim() == '') {
                        return '!!';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: detailsController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'تفاصيل الخبر...'),
                    validator: (validator) {
                      if (validator!.trim() == "") {
                        return '!!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
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
                  defaultButton(
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
                      width: 60,
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
