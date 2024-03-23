import 'package:flutter/material.dart';
import 'package:news_last_app/core/app_routes/app_routes.dart';
import 'package:news_last_app/presentation/screens/my_profile_view/widgets/settings_view.dart';

import '../data/my_profile_item_model.dart';
import 'my_profile_list_view_item.dart';

class MyProfileListView extends StatelessWidget {
  const MyProfileListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MyProfileItemModel> items = [
      MyProfileItemModel(
          icon: Icons.settings_outlined,
          title: 'الاعدادات',
          () => customPushNavigator(context, const SettingsView())),
      MyProfileItemModel(
          icon: Icons.star_border_outlined, title: 'قيم تطبيقنا', () => null),
      MyProfileItemModel(icon: Icons.share, title: 'شارك تطبيقنا', () => null),
      MyProfileItemModel(icon: Icons.logout, title: 'تسجيل الخروج', () => null),
    ];
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return MyProfileListViewItem(myProfileItemModel: items[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            indent: 30,
            endIndent: 30,
            height: 10,
            thickness: 0.8,
          );
        },
        itemCount: items.length);
  }
}
