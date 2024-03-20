import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/screens/settings_view/widgets/profile_card.dart';
import 'package:news_last_app/presentation/screens/settings_view/widgets/settings_list_view.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileCard(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
          ),
          Expanded(child: SettingsListView()),
        ],
      ),
    );
  }
}
