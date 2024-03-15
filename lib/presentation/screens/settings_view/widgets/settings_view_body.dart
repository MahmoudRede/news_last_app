import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/screens/settings_view/widgets/profile_card.dart';
import 'package:news_last_app/presentation/screens/settings_view/widgets/settings_list_view.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'المزيد',
            style: TextStyle(color: ColorManager.primaryColor, fontSize: 20),
          ),
          SizedBox(
            height: 16,
          ),
          ProfileCard(),
          SizedBox(
            height: 40,
          ),
          Expanded(child: SettingsListView()),
        ],
      ),
    );
  }
}
