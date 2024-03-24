import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';

import '../../../../generated/assets.dart';
import '../../../../styles/app_size/app_size_config.dart';
import '../../../../styles/color_manager/color_manager.dart';


class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var userModel = AppCubit.get(context).userModel;
        return Card(
          elevation: 5,
          surfaceTintColor: Colors.white,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(42),
              bottomRight: Radius.circular(42),
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
          child: Row(
            children: [
               CircleAvatar(
                radius: 43,
                backgroundColor: ColorManager.primaryColor,
                child: CircleAvatar(
                    radius: 50,
                    backgroundImage: userModel!.image == null? const AssetImage(
                      Assets.imagesProfilePic,
                    ) : NetworkImage(userModel.image!) as ImageProvider,),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                '${userModel.userName}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.headline2Size,
                    color: ColorManager.primaryColor
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
