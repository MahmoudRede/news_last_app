import 'package:flutter/material.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

import '../data/my_profile_item_model.dart';

class MyProfileListViewItem extends StatelessWidget {
  const MyProfileListViewItem({super.key, required this.myProfileItemModel});

  final MyProfileItemModel myProfileItemModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myProfileItemModel.function,
      child: ListTile(
        leading:  Icon(
          myProfileItemModel.icon,
          size: 25,
          color: ColorManager.primaryColor,
        ),
        title: Text(
          myProfileItemModel.title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.height * 0.022,
              color: ColorManager.primaryColor),
        ),
      ),
    );
  }
}
