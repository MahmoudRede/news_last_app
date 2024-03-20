import 'package:flutter/material.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

import '../data/settings_item_model.dart';

class SettingsListViewItem extends StatelessWidget {
  const SettingsListViewItem({super.key, required this.settingsItemModel});

  final SettingsItemModel settingsItemModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Icon(
        settingsItemModel.icon,
        size: 25,
        color: ColorManager.primaryColor,
      ),
      title: Text(
        settingsItemModel.title,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.height * 0.022,
            color: ColorManager.primaryColor),
      ),
    );
  }
}
