import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';
import '../../../../styles/app_size/app_size_config.dart';
import '../../../../styles/color_manager/color_manager.dart';



class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(52),
          bottomRight: Radius.circular(52),
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 53,
            backgroundColor: ColorManager.primaryColor,
            child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  Assets.imagesProfile,
                )),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            'زائر',
            style: TextStyle(
                fontSize: SizeConfig.headline2Size,
                color: ColorManager.primaryColor),
          )
        ],
      ),
    );
  }
}
