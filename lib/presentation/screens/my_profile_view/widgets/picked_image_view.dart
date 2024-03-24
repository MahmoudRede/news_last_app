import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';

import '../../../../styles/color_manager/color_manager.dart';
import '../../../widgets/default_button.dart';

class PickedImageView extends StatelessWidget {
  const PickedImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state){
        if (state is UploadProfilePhotoSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var profileImage = AppCubit.get(context).profileImage;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 350,
                width: 400,
                child: Image(image: FileImage(profileImage!) as ImageProvider,),
              ),
              const SizedBox(
                height: 8,
              ),
              defaultButton(
                  onPressed: (){
                    AppCubit.get(context).uploadProfileImage();
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
