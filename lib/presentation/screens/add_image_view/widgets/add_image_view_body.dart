import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/image_cubit/image_cubit.dart';

import '../../../../generated/assets.dart';
import '../../../../styles/app_size/app_size_config.dart';
import '../../../../styles/color_manager/color_manager.dart';
import '../../../widgets/default_button.dart';

class AddImageViewBody extends StatelessWidget {
  const AddImageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ImageCubit.get(context);
        return SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('اضافة صورة',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: SizeConfig.height * 0.025,
                            color: ColorManager.primaryColor)),
                  ),
                  SizedBox(height: SizeConfig.height * 0.01),
                  if (cubit.image != null)
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
                            image: FileImage(cubit.image!),
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
                  if (cubit.image == null)
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
                        cubit.uploadImage();},
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
