import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/settings_view/widgets/settings_list_view_item.dart';

import '../data/settings_item_model.dart';

class SettingsListView extends StatelessWidget {
  const SettingsListView({super.key});

  final List<SettingsItemModel> items = const [
    SettingsItemModel(icon: Icons.settings_outlined, title: 'الاعدادات'),
    SettingsItemModel(icon: Icons.translate, title: 'اللغة'),
    SettingsItemModel(icon: Icons.star_border_outlined, title: 'قيم تطبيقنا'),
    SettingsItemModel(icon: Icons.share, title: 'شارك تطبيقنا'),
    SettingsItemModel(icon: Icons.logout, title: 'تسجيل الخروج'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return SettingsListViewItem(settingsItemModel: items[index]);
        },
        separatorBuilder: (context, index){
          return const Divider(
            indent: 30,
            endIndent: 30,
            height: 30,
            thickness: 0.8,
          );
        },
        itemCount: items.length);
  }
}
